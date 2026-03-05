(function() { function bxBootstrap() {
	var re = /bot|crawl|slurp|spider|mediapartners|headlesschrome|snap-prefetch|remotasks|woorank|uptime\.com|facebookexternalhit|facebookcatalog/i;
	if (re.test(navigator.userAgent) || navigator.userAgent == '') {
		return;
	}

	if (!(window.bouncex&&bouncex.website)) {
		var pushedData = [];
		if(window.bouncex && bouncex.push && bouncex.length){
			pushedData = bouncex;
		}
		window.bouncex = {};
		bouncex.pushedData = pushedData;
		bouncex.website = {"id":5877,"name":"Reach PLC | Manchester Evening News","cookie_name":"bounceClientVisit5877","domain":"manchestereveningnews.co.uk","ct":"fp_local_storage","ally":0,"ei":0,"tcjs":"","cjs":"/* enable.feature.PBM_TAGID_UPDATE */\n","force_https":false,"waypoints":false,"content_width":900,"gai":"","swids":"","sd":0,"ljq":"auto","campaign_id":0,"is_preview":false,"aco":{"first_party_limit":"3500","local_storage":"1"},"cmp":{"gdpr":1,"gmp":0,"whitelist_check":0},"burls":[],"ple":false,"fbe":true,"ffs":"PRESTRUCTURE_OPT_IN","mas":2,"map":1,"gar":true,"ete":2,"ettm":true,"etjs":"","dge":true,"bxidLoadFirst":false,"pie":false,"cme":false,"gbi_enabled":1,"bpush":false,"pt":null,"els":{"infeed":"#article-body > p:nth-child(n+10):has(+ p)"},"vars":[{"name":"video_present","polling":"all","persist":"no","page_types":[],"testmode":false,"default":"false","code":"jQuery('div[data-player-type=\"jwplayer\"]').length > 0;","trigger":"pageload"},{"name":"infeed_anchor_present","polling":"none","persist":"no","page_types":[],"testmode":false,"default":"false","code":"!!bouncex.website.els && !!bouncex.website.els.infeed && jQuery(bouncex.website.els.infeed).length > 0;","trigger":"pageload"}],"dgu":"pixel.cdnwidget.com","dgp":false,"ba":{"enabled":0,"fbte":0},"biu":"assets.bounceexchange.com","bau":"api.bounceexchange.com","beu":"events.bouncex.net","ibx":{"tjs":"","cjs":"","miw":0,"mibcx":1,"te":0,"cart_rep":{"get":"","set":""},"ulpj":null,"cus":"","miw_exclude":"","enabled":0},"etjson":null,"osre":true,"osru":"osr.bounceexchange.com/v1/osr/items","checkDfp":false,"gamNetwork":"","spa":0,"spatm":1,"preinit_cjs":"","crs":{"integrations":null,"pageCount":null},"mat":0,"math":0,"cpnu":"coupons.bounceexchange.com","dfpcms":0,"sms":{"optm":"","eventSharing":false,"shqId":"","enabled":0},"pde":false,"fme":false,"fmx":"","uid2":false,"sdk":{"android":{"enabled":false,"enabledVersions":[],"eventModifications":null},"ios":{"enabled":false,"enabledVersions":[],"eventModifications":null}},"onsite":{"enabled":1},"ads":{"enabled":1},"pubs":{"enabled":1},"websdk":{"enabled":0,"devMode":0},"ga4_property_id":"","ga4_measurement_id":"","tag_state_domain":"","tag_state_domain_enabled":false,"tag_state_sst_enabled":false}
;

		if (bouncex.website && bouncex.website.ads) {
			bouncex.website.ads.IABPubAccountID = 5925;
		}

		bouncex.tag = 'tag3';
		bouncex.$ = window.jQuery;
		bouncex.env = 'production';
		bouncex.restrictedTlds = {"casl":{"ca":1},"gdpr":{"ad":1,"al":1,"at":1,"ax":1,"ba":1,"be":1,"bg":1,"by":1,"xn--90ais":1,"ch":1,"cy":1,"cz":1,"de":1,"dk":1,"ee":1,"es":1,"eu":1,"fi":1,"fo":1,"fr":1,"uk":1,"gb":1,"gg":1,"gi":1,"gr":1,"hr":1,"hu":1,"ie":1,"im":1,"is":1,"it":1,"je":1,"li":1,"lt":1,"lu":1,"lv":1,"mc":1,"md":1,"me":1,"mk":1,"xn--d1al":1,"mt":1,"nl":1,"no":1,"pl":1,"pt":1,"ro":1,"rs":1,"xn--90a3ac":1,"ru":1,"su":1,"xn--p1ai":1,"se":1,"si":1,"sj":1,"sk":1,"sm":1,"ua":1,"xn--j1amh":1,"va":1,"tr":1}};
		bouncex.client = {
			supportsBrotli: 1
		};
		bouncex.assets = {"ads":"01848d0d1ed9c667ed7719629b317dcb","creativesBaseStyles":"a53944a2","gpsAuction":"bbb80866120d17013073bb6d284cbd6b","inbox":"32bf39f4d601f8da6f38d8a236e3a4b1","onsite":"1238d00d70e4de87443df9eb69ff1a61","sms":"e39203556bab2366e56296ce42e974a7","websdk":"ce4f7e1528b69b73de9be032afe17e84","website_campaigns_5877":"b609bf40e7bf2360fb3b2bb0b9727551"};
		bouncex.push = function(pushData) {
			bouncex.pushedData.push(pushData);
		}

		var runtime = document.createElement('script');
		runtime.setAttribute('src', '//assets.bounceexchange.com/assets/smart-tag/versioned/runtime_c81e76ee00d795b1eebf8d27949f8dc5.br.js');
		runtime.setAttribute('async', 'async');

		bouncex.initializeTag = function() {
			var script = document.createElement('script');
			script.setAttribute('src', '//assets.bounceexchange.com/assets/smart-tag/versioned/main-v2_4cded4d2f7735616c8e0c1138a1dd44e.br.js');
			script.setAttribute('async', 'async');
			document.body.appendChild(script);


			var deviceGraphScript = document.createElement('script');
			deviceGraphScript.setAttribute('src', '//assets.bounceexchange.com/assets/smart-tag/versioned/cjs_min_c84323e2726f3e99b307ab7740c6434b.js');
			deviceGraphScript.setAttribute('async', 'async');
			var dgAttrs = [{"Key":"id","Value":"c.js"},{"Key":"async","Value":"true"},{"Key":"data-apikey","Value":"2^HIykD"},{"Key":"data-cb","Value":"bouncex.dg.initPostDeviceGraph"},{"Key":"data-bx","Value":"1"},{"Key":"data-adcb","Value":"bouncex.dg.getAdsOptStatus"}];
			if (dgAttrs) {
				for (var i = 0; i < dgAttrs.length; i++) {
					deviceGraphScript.setAttribute(dgAttrs[i].Key, dgAttrs[i].Value);
				}
			}
			document.body.appendChild(deviceGraphScript);

			bouncex.initializeTag = function() {};
		};

		runtime.onload = bouncex.initializeTag;
		document.body.appendChild(runtime);

	}


}

if (document.readyState === "loading") {
	document.addEventListener("DOMContentLoaded", bxBootstrap);
} else {
	bxBootstrap();
}})();