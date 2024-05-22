"use strict";
const loadWebpack = () => {
    try {
        const require = window.webpackChunkclient_web.push([[Symbol()], {}, (re) => re]);
        const cache = Object.keys(require.m).map(id => require(id));
        const modules = cache
            .filter(module => typeof module === "object")
            .flatMap(module => {
            try {
                return Object.values(module);
            }
            catch { }
        });
        const functionModules = modules.filter(module => typeof module === "function");
        return { cache, functionModules };
    }
    catch (error) {
        console.error("adblockify: Failed to load webpack", error);
        return { cache: [], functionModules: [] };
    }
};
const getSettingsClient = (cache) => {
    try {
        return cache.find((m) => m.settingsClient).settingsClient;
    }
    catch (error) {
        console.error("adblockify: Failed to get ads settings client", error);
        return null;
    }
};
const getSlotsClient = (functionModules, transport) => {
    try {
        const slots = functionModules.find(m => m.SERVICE_ID === "spotify.ads.esperanto.slots.proto.Slots" || m.SERVICE_ID === "spotify.ads.esperanto.proto.Slots");
        return new slots(transport);
    }
    catch (error) {
        console.error("adblockify: Failed to get slots client", error);
        return null;
    }
};
const map = new Map();
const retryCounter = (slotId, action) => {
    if (!map.has(slotId))
        map.set(slotId, { count: 0 });
    if (action === "increment")
        map.get(slotId).count++;
    else if (action === "clear")
        map.delete(slotId);
    else if (action === "get")
        return map.get(slotId)?.count;
};
(async function adblockify() {
    // @ts-expect-error: Events are not defined in types
    await new Promise(res => Spicetify.Events.platformLoaded.on(res));
    if (!window.webpackChunkclient_web) {
        setTimeout(adblockify, 50);
        return;
    }
    const webpackCache = loadWebpack();
    // @ts-expect-error: expFeatureOverride is not defined in types
    const { CosmosAsync, Platform, expFeatureOverride, Locale } = Spicetify;
    const { AdManagers } = Platform;
    const { audio } = AdManagers;
    const { UserAPI } = Platform;
    const productState = UserAPI._product_state || UserAPI._product_state_service || Platform?.ProductStateAPI?.productStateApi;
    if (!CosmosAsync) {
        setTimeout(adblockify, 100);
        return;
    }
    const slots = await CosmosAsync.get("sp://ads/v1/slots");
    const disableAds = async () => {
        try {
            await productState.putOverridesValues({ pairs: { ads: "0", catalogue: "premium", product: "premium", type: "premium" } });
        }
        catch (error) {
            console.error("adblockify: Failed inside `disableAds` function\n", error);
        }
    };
    const configureAdManagers = async () => {
        try {
            const { billboard, leaderboard, inStreamApi, sponsoredPlaylist } = AdManagers;
            audio.audioApi.cosmosConnector.increaseStreamTime(-100000000000);
            billboard.billboardApi.cosmosConnector.increaseStreamTime(-100000000000);
            await audio.disable();
            audio.isNewAdsNpvEnabled = false;
            await billboard.disable();
            await leaderboard.disableLeaderboard();
            await inStreamApi.disable();
            await sponsoredPlaylist.disable();
            if (AdManagers?.vto) {
                const { vto } = AdManagers;
                await vto.manager.disable();
                vto.isNewAdsNpvEnabled = false;
            }
            setTimeout(disableAds, 100);
        }
        catch (error) {
            console.error("adblockify: Failed inside `configureAdManagers` function\n", error);
        }
    };
    const bindToSlots = async () => {
        for (const slot of slots) {
            subToSlot(slot.slot_id);
            handleAdSlot({ adSlotEvent: { slotId: slot.slot_id } });
        }
    };
    const handleAdSlot = (data) => {
        const slotId = data?.adSlotEvent?.slotId;
        try {
            const adsCoreConnector = audio.inStreamApi.adsCoreConnector;
            if (typeof adsCoreConnector?.clearSlot === "function")
                adsCoreConnector.clearSlot(slotId);
            const slotsClient = getSlotsClient(webpackCache.functionModules, productState.transport);
            if (slotsClient)
                slotsClient.clearAllAds({ slotId });
            updateSlotSettings(slotId);
        }
        catch (error) {
            console.error("adblockify: Failed inside `handleAdSlot` function. Retrying in 1 second...\n", error);
            retryCounter(slotId, "increment");
            if (retryCounter(slotId, "get") > 5) {
                console.error(`adblockify: Failed inside \`handleAdSlot\` function for 5th time. Giving up...\nSlot id: ${slotId}.`);
                retryCounter(slotId, "clear");
                return;
            }
            setTimeout(handleAdSlot, 1 * 1000, data);
        }
        configureAdManagers();
    };
    const updateSlotSettings = async (slotId) => {
        try {
            const settingsClient = getSettingsClient(webpackCache.cache);
            if (!settingsClient)
                return;
            await settingsClient.updateStreamTimeInterval({ slotId, timeInterval: "0" });
            await settingsClient.updateSlotEnabled({ slotId, enabled: false });
            await settingsClient.updateDisplayTimeInterval({ slotId, timeInterval: "0" });
        }
        catch (error) {
            console.error("adblockify: Failed inside `updateSlotSettings` function\n", error);
        }
    };
    const intervalUpdateSlotSettings = async () => {
        for (const slot of slots) {
            updateSlotSettings(slot.slot_id);
        }
    };
    const subToSlot = (slot) => {
        try {
            audio.inStreamApi.adsCoreConnector.subscribeToSlot(slot, handleAdSlot);
        }
        catch (error) {
            console.error("adblockify: Failed inside `subToSlot` function\n", error);
        }
    };
    const runObserver = () => {
        const nodeList = Array.from(document.querySelectorAll(".ReactModalPortal"));
        const observer = new MutationObserver(mutations => {
            for (const mutation of mutations) {
                if (mutation.addedNodes.length) {
                    const node = mutation.addedNodes[0];
                    const InAppModal = node.classList.contains("GenericModal__overlay");
                    if (!InAppModal)
                        continue;
                    const iframe = node.querySelector("iframe");
                    if (!iframe)
                        continue;
                    const iframeBody = iframe?.contentWindow?.document.body;
                    if (!iframeBody)
                        continue;
                    const promotional = iframeBody.querySelector("[data-click-to-action-url*='/premium-promotional-offer-terms']");
                    if (!promotional)
                        continue;
                    node.remove();
                }
            }
        });
        for (const node of nodeList) {
            observer.observe(node, { childList: true });
        }
    };
    const enableExperimentalFeatures = async () => {
        try {
            const expFeatures = JSON.parse(localStorage.getItem("spicetify-exp-features") || "{}");
            const hptoEsperanto = expFeatures.enableEsperantoMigration?.value;
            const inAppMessages = expFeatures.enableInAppMessaging?.value;
            const upgradeCTA = expFeatures.hideUpgradeCTA?.value;
            if (!hptoEsperanto)
                expFeatureOverride({ type: "bool", name: "enableEsperantoMigration", default: true });
            if (inAppMessages)
                expFeatureOverride({ type: "bool", name: "enableInAppMessaging", default: false });
            if (!upgradeCTA)
                expFeatureOverride({ type: "bool", name: "hideUpgradeCTA", default: true });
        }
        catch (error) {
            console.error("adblockify: Failed inside `enableExperimentalFeatures` function\n", error);
        }
    };
    enableExperimentalFeatures();
    bindToSlots();
    // to enable one day if disabling `enableInAppMessages` exp feature doesn't work
    //runObserver();
    productState.subValues({ keys: ["ads", "catalogue", "product", "type"] }, () => configureAdManagers());
    // Update slot settings after 5 seconds... idk why, don't ask me why, it just works
    setTimeout(intervalUpdateSlotSettings, 5 * 1000);
})();
