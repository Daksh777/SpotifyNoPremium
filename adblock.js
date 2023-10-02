//@ts-check

// NAME: adblock
// AUTHOR: CharlieS1103
// DESCRIPTION: Block all audio and UI ads on Spotify

/// <reference path="../../spicetify-cli/globals.d.ts" />

(function adblock() {
    const { Platform } = Spicetify;
    if (!Platform) {
        setTimeout(adblock, 300)
        return
    }
    
    delayAds();
    
    const billboard = Spicetify.Platform.AdManagers.billboard.displayBillboard;

    Spicetify.Platform.AdManagers.billboard.displayBillboard = function (arguments) {
        Spicetify.Platform.AdManagers.billboard.finish()
        // hook before call
        var ret = billboard.apply(this, arguments);
        // hook after call
        Spicetify.Platform.AdManagers.billboard.finish()
        const observer = new MutationObserver((mutations, obs) => {
            const billboardAd = document.getElementById('view-billboard-ad');
            if (billboardAd) {
                Spicetify.Platform.AdManagers.billboard.finish()
                obs.disconnect();
                return;
            }
        });

        observer.observe(document, {
            childList: true,
            subtree: true
        });
        return ret;
    };

    async function delayAds() {
        if (!Spicetify.Platform?.UserAPI) {
            setTimeout(delayAds, 300);
            return; 
        }
        const productState = Spicetify.Platform.UserAPI._product_state || Spicetify.Platform.UserAPI._product_state_service;

        await productState.putOverridesValues({ pairs: { ads: "0", catalogue: "premium", product: "premium", type: "premium" } });
        Spicetify.Platform.AdManagers.audio.audioApi.cosmosConnector.increaseStreamTime(-100000000000);
        Spicetify.Platform.AdManagers.billboard.billboardApi.cosmosConnector.increaseStreamTime(-100000000000);
        await Spicetify.Platform.AdManagers.audio.disable();
        await Spicetify.Platform.AdManagers.billboard.disable();
        await Spicetify.Platform.AdManagers.leaderboard.disableLeaderboard();
        await Spicetify.Platform.AdManagers.sponsoredPlaylist.disable();
        
        console.log("[Adblock] Ads disabled", Spicetify.Platform.AdManagers);
    };

    setInterval(delayAds, 30 * 10000);
    
    (async function disableEsperantoAds() {
        if (!Spicetify.Platform?.UserAPI) {
            setTimeout(disableEsperantoAds, 300);
            return;
        }
        try{
            const productState = Spicetify.Platform.UserAPI._product_state || Spicetify.Platform.UserAPI._product_state_service;
        
            await productState.putOverridesValues({ pairs: { ads: "0", catalogue: "premium", product: "premium", type: "premium" } });
            productState.subValues({ keys: ["ads"] }, () => {
                delayAds();
            });
        }catch(e){
            console.log("[Adblock] Product State does not exist", e);
        }
       
    })();
})()
