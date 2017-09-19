
var checkloginyn = "";
var GnbHandler = function() {
	var $depth1root = null;
	var $depth1menu = null;
	var $depth2root = null;
	var $depth2menu = null;
	var $depth3root = null;
	
	var currentDepth1Index = -1;	
	var currentDepth2Index = -1;	
	var depth1Timer = null;		
	
	
	var settings = {
		naviRootSelector: "#gnb_navi",			
		utilRootSelector: "#gnb_util",			
		depth1MenuSelector: "> li",				
		depth2RootSelector: "> .depth_wrap",	
		depth2BoxSelector: ".depth",			
		depth2MenuSelector: ".depth2 > li",		
		depth3RootSelector: "> .depth3",		
		depth2ShowDelay: 200,					
		depth2ShowInterval: 25,					
		depth2ShowDuration: 500,				
		depth2ShowEasing: "easeInQuad",			
		depth2HideDelay: 300,					
		depth2HideInterval: 20,					
		depth2HideDuration: 300,				
		depth2HideEasing: "easeInQuad"			
	};
	
	
	return {

		init: function(options) {

			jQuery.extend(settings, options);
			
			$depth1root = jQuery(settings["naviRootSelector"]).add(settings["utilRootSelector"]);
			$depth1menu = $depth1root.find(settings["depth1MenuSelector"]);
			$depth2root = $depth1menu.find(settings["depth2RootSelector"]);
			$depth2menu = $depth2root.find(settings["depth2MenuSelector"]);
			$depth3root = $depth2menu.find(settings["depth3RootSelector"]);
			
			jQuery(".depth_close").unbind("click").click(function(){
				jQuery("#gnb_navi li").removeClass("smon");
				GnbHandler.hide2();
				return false;
			});

			jQuery(settings["naviRootSelector"]).find(settings["depth1MenuSelector"]).each(function(d1idx) {
				var $d1menu = jQuery(this);
				var $d2root = $d1menu.find(settings["depth2RootSelector"]);
				var $d2menu = $d2root.find(settings["depth2MenuSelector"]);

				$d1menu.click(
					function() {
						jQuery(this).parent().find("li").removeClass("smon");
						jQuery(this).addClass("smon");
						//alert($d1menu.get(0).nodeName);
						clearTimeout(depth1Timer);
						GnbHandler.show2(d1idx);
					}
				);
				/*
				$d2menu.each(function(d2idx) {
					jQuery(this).unbind("mouseenter").mouseenter(function() {
						GnbHandler.show3(d1idx, d2idx);
					});
				});
				*/
				
			});
			
			jQuery(window).resize(function() {	
				var $header_wrap = jQuery("#header_wrap");
				var $header = jQuery("#header");
				
				$header_wrap.width("");
				if ($header_wrap.width() < $header.outerWidth()) {
					//$header_wrap.width($header.outerWidth());
					$header_wrap.width("100%");
				}
				
				if (jQuery.browser.msie && jQuery.browser.version <= 6) {
					var $d1root = jQuery(settings["naviRootSelector"]).add(settings["utilRootSelector"]);
					var $d1menu = $d1root.find(settings["depth1MenuSelector"]);
					var $d2root = $d1menu.find(settings["depth2RootSelector"]);
					
					$d2root.width(document.body.offsetWidth);
				}
			});
			jQuery(window).trigger("resize");
		},
		
		show2: function(d1idx) {
			clearTimeout(depth1Timer);
			
			var $d1menu = $depth1menu.eq(d1idx);
			var $d2root = $d1menu.find(settings["depth2RootSelector"]);
			var isShow = currentDepth1Index > -1; 
			
			if (d1idx != currentDepth1Index && $d1menu.length) {
				GnbHandler.hide2($d2root.length);
				
				if ($d2root.length) {
					
					if (isShow) {
						$d2root.stop(true).css({display:"block",height:"",overflow:""});
					}
					else {
						jQuery.fx.interval = settings["depth2ShowInterval"];
						$d2root.stop(true).animate({height:"show"}, settings["depth2ShowDuration"], settings["depth2ShowEasing"], function() {
							jQuery(this).css({overflow:""});
						});
					}

					currentDepth2Index = -1;
					GnbHandler.show3(d1idx, 0, isShow);

					if (window.MainVisualHandler) {
						window.MainVisualHandler.stop();
					}
				}

				currentDepth1Index = d1idx;
			}
		},
		
		show_new: function(d1idx,searchtype) {
			//showLoading();

			var sSearchType = searchtype;//"SEQ";
			var params="searchType=" + sSearchType ;
			callJson("getSitemapList", "com.scard.hp.common.web.NHPCOMMAIN001Ctrl", "getSitemapList", params, "_mainJsonCallback");

			jQuery("#sitemapHead").removeClass();
			jQuery("#sitemapHead").addClass("tab04");

			jQuery("#id_sitemap .btnc").eq(0).show();
			jQuery("#id_sitemap .btnc").eq(1).hide();

			if(sSearchType == "SEQ") {
				jQuery("#imgSitemapSeq").attr("src", "/images/main/txt_view_category_on.png");
				jQuery("#imgSitemapName").attr("src", "/images/main/txt_view_alphabet_off.png");
			} else {
				jQuery("#imgSitemapSeq").attr("src", "/images/main/txt_view_category_off.png");
				jQuery("#imgSitemapName").attr("src", "/images/main/txt_view_alphabet_on.png");
			}

			jQuery("#id_btn_sitemap").attr("src", "/images/main/gnb_sitemap_on.png");

			hide_select();			
			
			clearTimeout(depth1Timer);
	
			var $d1menu = $depth1menu.eq(d1idx);
			var $d2root = $d1menu.find(settings["depth2RootSelector"]);
			var isShow = currentDepth1Index > -1;  
			
			if (d1idx != currentDepth1Index && $d1menu.length) {

				GnbHandler.hide2($d2root.length);
				
				if ($d2root.length) {

					if (isShow) {
						$d2root.stop(true).css({display:"block",height:"",overflow:""});
					}
					else {
						jQuery.fx.interval = settings["depth2ShowInterval"];
						$d2root.stop(true).animate({height:"show"}, settings["depth2ShowDuration"], settings["depth2ShowEasing"], function() {
							jQuery(this).css({overflow:""});
						});
					}

					currentDepth2Index = -1;
					GnbHandler.show3(d1idx, 0, isShow);
	
					if (window.MainVisualHandler) {
						window.MainVisualHandler.stop();
					}
				}

				currentDepth1Index = d1idx;
			}
		},			


		show_new2: function(d1idx) {
			//showLoading();
			
			showMyMenu('MYMENU');
			//callJson("getLoginInfoToMYMENU", "com.scard.hp.common.web.NHPCOMMAIN001Ctrl", "getLoginInfo", "", "_mainJsonCallback");
			//showMyMenu('MANAGE');
			
			//jQuery("#my_menu .btnc").eq(1).show();
			//jQuery("#my_menu .btnc").eq(0).hide();		
			
			var $d1menu = $depth1menu.eq(d1idx);
			var $d2root = $d1menu.find(settings["depth2RootSelector"]);
			var isShow = currentDepth1Index > -1; 
			
			if (d1idx != currentDepth1Index && $d1menu.length) {
				//Depth2 숨김
				GnbHandler.hide2($d2root.length);
				
				if ($d2root.length) {
					//Depth2 노출
					if (isShow) {
						$d2root.stop(true).css({display:"block",height:"",overflow:""});
					}
					else {
						jQuery.fx.interval = settings["depth2ShowInterval"];
						$d2root.stop(true).animate({height:"show"}, settings["depth2ShowDuration"], settings["depth2ShowEasing"], function() {
							jQuery(this).css({overflow:""});
						});
					}
					
					currentDepth2Index = -1;
					GnbHandler.show3(d1idx, 0, isShow);
					

					if (window.MainVisualHandler) {
						window.MainVisualHandler.stop();
					}
				}

				currentDepth1Index = d1idx;
			}
		},				

		hide2: function(force) {
			clearTimeout(depth1Timer);
			
			var $d2root = $depth2root.filter(":visible");
			
			jQuery("#AKCDivMain").removeClass("AKCDivMain").addClass("none");
			
			if ($d2root.length) {
				if (force) {
					$d2root.stop(true).css({display:"none",height:"",overflow:""});
				}
				else {
					jQuery.fx.interval = settings["depth2HideInterval"];
					$d2root.stop(true).animate({height:"hide"}, settings["depth2HideDuration"], settings["depth2HideEasing"], function() {
						jQuery(this).css({height:"",overflow:""});
					});
				}
				
				if (window.MainVisualHandler) {
					window.MainVisualHandler.start();
				}
			}
			
			currentDepth1Index = -1;
		},
		
		show3: function(d1idx, d2idx, isFirst) {
			var $d1menu = $depth1menu.eq(d1idx);
			var $d2root = $d1menu.find(settings["depth2RootSelector"]);
			var $d2menu = $d2root.find(settings["depth2MenuSelector"]).eq(d2idx);
			var $d3root = $d2menu.find(settings["depth3RootSelector"]);
			
			if (d2idx != currentDepth2Index && $d2menu.length) {

				GnbHandler.hide3();
				
				$d2menu.children("a").addClass("on");
				$d3root.show();

				if ($d3root.length) {
					var $d2box = $d2root.find(settings["depth2BoxSelector"]);
					var originHeight = $d2box.data("originHeight");
					var targetHeight = $d3root.data("targetHeight");
					
					if (originHeight === undefined) {
						originHeight = $d2box.height();
						$d2box.data("originHeight", originHeight);
					}
					
					if (targetHeight === undefined) {
						targetHeight = $d2menu.position().top + $d3root.height();
						$d3root.data("targetHeight", targetHeight);
					}
					
					if (originHeight < targetHeight) {
						jQuery.fx.interval = 20;
						$d2box.stop(true,isFirst).animate({height:targetHeight}, 300, "linear", function() {
							jQuery(this).css({overflow:""});
						});
					}	
				}
				
				currentDepth2Index = d2idx;
			}
		},
		
		hide3: function() {
			var $d2root = $depth2root.filter(":visible");
			var $d2menu = $depth2menu.filter(":visible");
			var $d3root = $depth3root.filter(":visible");
				
			if ($d2menu.length) {
				$d2menu.children("a").removeClass("on");
				$d3root.hide();

				if ($d3root.length) {
					var $d2box = $d2root.find(settings["depth2BoxSelector"]);
					var originHeight = $d2box.data("originHeight");
					
					if (originHeight !== undefined) {
						jQuery.fx.interval = 20;
						$d2box.stop(true).animate({height:originHeight}, 300, "linear", function() {
							jQuery(this).css({height:"",overflow:""});
						});
					}
				}
			}
			
			currentDepth2Index = -1;
		}
	};
}();

function displaySitemapList_new(voList, bIncludeCheckBox) {

	var rootDiv = jQuery("#sitemap_all");
	var topDiv ;
	var itemUL ;

	rootDiv.empty();

	for(var i=0; i<voList.length; i++) {
		var vo = voList[i];

		if(vo.upMenuId=="NHP") {

			if(itemUL != null) {
				topDiv.append(itemUL);
				itemUL = null;
			}

			if(topDiv != null) {
				rootDiv.append(topDiv);
			}

			topDiv = jQuery(document.createElement("div"));

			if(!bIncludeCheckBox) {
				if (i == 0) {
					topDiv.addClass("fl_left first");
				} else {
					topDiv.addClass("fl_left");
				}
				
			} else {
				topDiv.addClass("fl_left setting_ma");
			}

			var h4 = jQuery(document.createElement("h4"));
			var img = jQuery(document.createElement("img"));
			img.attr("alt",vo.menuTitle);
			img.attr("src", getSitemapTopImg_new(vo.menuId));

			if(vo.menuUri != null && vo.menuUri != "") {
				var aLink = jQuery(document.createElement("a"));

				if(vo.menuUri.indexOf("/") > -1) {
					aLink.attr("href",vo.menuUri);
					aLink.attr("target","_blank");
				} else {
					aLink.attr("href","javascript:" + vo.menuUri + ";");
				}

				aLink.append(img);
				h4.append(aLink);

			} else {
				h4.append(img);
			}

			topDiv.append(h4);

		} else if(vo.menuType == "MN") {

			if(itemUL != null) {
				topDiv.append(itemUL);
				itemUL = null;
			}

			var h5 = jQuery(document.createElement("h5"));

			if(!bIncludeCheckBox && vo.menuUri != null && vo.menuUri != "") {
				h5.append(getLinkTagOfSitemap(vo));

			} else if(bIncludeCheckBox && vo.menuUri != null && vo.menuUri != "") {
				var str = "<input type=\"checkbox\" value=\"" + vo.menuId + "\"";

				if(vo.userId != null && vo.userId != "") {
					str += " checked=\"true\"/>" ;
				} else {
					str += " />" ;
				}

				h5.html(str + vo.menuTitle);

			} else {
				h5.text(vo.menuTitle);
			}

			topDiv.append(h5);

		} else {

			if(itemUL == null) {
				itemUL = jQuery(document.createElement("ul"));
			}

			var item = jQuery(document.createElement("li"));

			if(vo.highlightClass) {
				item.addClass(vo.highlightClass);
			}

			if(!bIncludeCheckBox) {
				item.append(getLinkTagOfSitemap(vo));

			} else {
				var str = "<input type=\"checkbox\" value=\"" + vo.menuId + "\"";

				if(vo.userId != null && vo.userId != "") {
					str += " checked=\"true\"/>" ;
				} else {
					str += " />" ;
				}

				item.html(str + vo.menuTitle);
			}

			itemUL.append(item);
			
		}
	}
	
	if(itemUL != null) {
		topDiv.append(itemUL);
		
		itemUL = null;
	}

	if(topDiv != null) {
		rootDiv.append(topDiv);
	}

	jQuery("#id_sitemap").show();
	hideLoading();
	hide_select();
}

function getSitemapTopImg_new(menuId) {
	var imgSrc = "/images/main_new/main_new/";

	switch(menuId) {
		case "NHPIMMH" :
			imgSrc += "h4_sitemap_myhome.png";
			break;

		case "NHPIMCD" :
			imgSrc += "h4_sitemap_card.png";
			break;

		case "NHPIMFS" :
			imgSrc += "h4_sitemap_finance.png";
			break;

		case "NHPIMSS" :
			imgSrc += "h4_sitemap_service.png";
			break;

		case "NHPIMCS" :
			imgSrc += "h4_sitemap_cs.png";
			break;
	}

	return imgSrc;
}

function displaySitemapList_new2(voList, bIncludeCheckBox) {

	var rootDiv = jQuery("#sitemap_all2");
	var topDiv ;
	var itemUL ;

	rootDiv.empty();

	for(var i=0; i<voList.length; i++) {
		var vo = voList[i];

		if(vo.upMenuId=="NHP") {

			if(itemUL != null) {
				topDiv.append(itemUL);
				itemUL = null;
			}

			if(topDiv != null) {
				rootDiv.append(topDiv);
			}

			topDiv = jQuery(document.createElement("div"));

			if(!bIncludeCheckBox) {
				topDiv.addClass("fl_left first");
			} else {
				topDiv.addClass("fl_left setting_ma");
			}

			var h4 = jQuery(document.createElement("h4"));
			var img = jQuery(document.createElement("img"));
			img.attr("alt",vo.menuTitle);
			img.attr("src", getSitemapTopImg_new(vo.menuId));

			if(vo.menuUri != null && vo.menuUri != "") {
				var aLink = jQuery(document.createElement("a"));

				if(vo.menuUri.indexOf("/") > -1) {
					aLink.attr("href",vo.menuUri);
					aLink.attr("target","_blank");
				} else {
					aLink.attr("href","javascript:" + vo.menuUri + ";");
				}

				aLink.append(img);
				h4.append(aLink);

			} else {
				h4.append(img);
			}

			topDiv.append(h4);

		} else if(vo.menuType == "MN") {

			if(itemUL != null) {
				topDiv.append(itemUL);
				itemUL = null;
			}

			var h5 = jQuery(document.createElement("h5"));

			if(!bIncludeCheckBox && vo.menuUri != null && vo.menuUri != "") {
				h5.append(getLinkTagOfSitemap(vo));

			} else if(bIncludeCheckBox && vo.menuUri != null && vo.menuUri != "") {
				var str = "<input type=\"checkbox\" value=\"" + vo.menuId + "\"";

				if(vo.userId != null && vo.userId != "") {
					str += " checked=\"true\"/>" ;
				} else {
					str += " />" ;
				}

				h5.html(str + vo.menuTitle);

			} else {
				h5.text(vo.menuTitle);
			}

			topDiv.append(h5);

		} else {

			if(itemUL == null) {
				itemUL = jQuery(document.createElement("ul"));
			}

			var item = jQuery(document.createElement("li"));

			if(vo.highlightClass) {
				item.addClass(vo.highlightClass);
			}

			if(!bIncludeCheckBox) {
				item.append(getLinkTagOfSitemap(vo));

			} else {
				var str = "<input type=\"checkbox\" value=\"" + vo.menuId + "\"";

				if(vo.userId != null && vo.userId != "") {
					str += " checked=\"true\"/>" ;
				} else {
					str += " />" ;
				}

				item.html(str + vo.menuTitle);
			}

			itemUL.append(item);
			
		}
	}
	
	if(itemUL != null) {
		topDiv.append(itemUL);
		
		itemUL = null;
	}

	if(topDiv != null) {
		rootDiv.append(topDiv);
	}

	jQuery("#id_sitemap").show();
	hideLoading();
	hide_select();
}
function check_loginyn(strgubun) {
	checkloginyn = strgubun;
}

var ssc = {} ;
ssc.Keywords = {container:null, target:null, displayHeight:0, displayCount:0, innerHTML:'', index:0, offsetTop:0, runtime:0, tweenID:0} ;
ssc.Keywords.init = function(e) {
	ssc.Keywords.container = document.getElementById('hotKeywords') ;
	if (ssc.Keywords.container != null) {
		ssc.Keywords.container.onmouseover = function() {
			this.className = 'keywords_detail' ;
			ssc.Keywords.stop() ;
			AKCIfrmMain.akc_hide();
		} ;
		ssc.Keywords.container.onmouseout = function() {
			this.className = 'keywords' ;
			ssc.Keywords.start() ;
		} ;
		ssc.Keywords.target = ssc.Keywords.container.getElementsByTagName('ol')[0] ;
		if (ssc.Keywords.target != null) {
			ssc.Keywords.displayHeight = 21 ;
			ssc.Keywords.displayCount = ssc.Keywords.target.getElementsByTagName('li').length ;
			ssc.Keywords.target.innerHTML += '<li class="rank1 dummy">' + ssc.Keywords.target.getElementsByTagName('li')[0].innerHTML + '</li>' ;
		}
		ssc.Keywords.start() ;
	}
} ;
ssc.Keywords.start = function() {
	if (this.target != null) {
		this.stop() ;
		this.runtime = setInterval(ssc.Keywords.scrolling, 2500) ;
	}
} ;
ssc.Keywords.stop = function() {
	clearInterval(this.runtime) ;
} ;
ssc.Keywords.scrolling = function() {
	ssc.Keywords.index++ ;
	clearInterval(ssc.Keywords.tweenID) ;
	ssc.Keywords.tweenID = setInterval(ssc.Keywords.tweening, 10) ;
} ;
ssc.Keywords.tweening = function() {
	ssc.Keywords.offsetTop -= 2 ;
	if (ssc.Keywords.offsetTop <= ssc.Keywords.index * ssc.Keywords.displayHeight * -1) {
		clearInterval(ssc.Keywords.tweenID) ;
		if (ssc.Keywords.index >= ssc.Keywords.displayCount) {
			ssc.Keywords.offsetTop = 0 ;
			ssc.Keywords.index = 0 ;
			ssc.Keywords.target.style.top = 0 ;
		} else {
			ssc.Keywords.target.style.top = (ssc.Keywords.index * ssc.Keywords.displayHeight * -1) + 'px' ;
		}
	} else {
		ssc.Keywords.target.style.top = ssc.Keywords.offsetTop + 'px' ;
	}
} ;

function goCardSearchOpen()
{
window.open("/cardsearch/cps.do?method=getIndexPage","POPCND","location=no,height=880px,width=1050px,scrollbars=yes,titlebar=no,toolbar=no,resizable=no,status=no,left=100");
}
function goShowRoomPop() {
window.open('/showroom/scard.jsp','ShowRoomPop', 'top='+(window.screen.availHeight-662)/2+',left='+(window.screen.availWidth-968)/2 +',width=968,height=662,scrollbars=yes,titlebar=no,toolbar=no,resizable=no,status=no');
}
