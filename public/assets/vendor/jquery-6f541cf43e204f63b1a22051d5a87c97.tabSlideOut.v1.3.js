/*
    tabSlideOUt v1.3
    
    By William Paoli: http://wpaoli.building58.com

    To use you must have an image ready to go as your tab
    Make sure to pass in at minimum the path to the image and its dimensions:
    
    example:
    
        $('.slide-out-div').tabSlideOut({
                tabHandle: '.handle',                         //class of the element that will be your tab -doesnt have to be an anchor
                pathToTabImage: 'images/contact_tab.gif',     //relative path to the image for the tab
                imageHeight: '133px',                         //height of tab image
                imageWidth: '44px',                           //width of tab image   
        });

    or you can leave out these options
    and set the image properties using css
    
*/
(function(a){a.fn.tabSlideOut=function(b){var c=a.extend({tabHandle:".handle",speed:300,action:"click",tabLocation:"left",topPos:"200px",leftPos:"20px",fixedPosition:!1,positioning:"absolute",pathToTabImage:null,imageHeight:null,imageWidth:null,onLoadSlideOut:!1},b||{});c.tabHandle=a(c.tabHandle);var d=this;c.fixedPosition===!0?c.positioning="fixed":c.positioning="absolute",document.all&&!window.opera&&!window.XMLHttpRequest&&(c.positioning="absolute"),c.pathToTabImage!=null&&c.tabHandle.css({background:"url("+c.pathToTabImage+") no-repeat",width:c.imageWidth,height:c.imageHeight}),c.tabHandle.css({display:"block",textIndent:"-99999px",outline:"none",position:"absolute"}),d.css({"line-height":"1",position:c.positioning});var e={containerWidth:parseInt(d.outerWidth(),10)+"px",containerHeight:parseInt(d.outerHeight(),10)+"px",tabWidth:parseInt(c.tabHandle.outerWidth(),10)+"px",tabHeight:parseInt(c.tabHandle.outerHeight(),10)+"px"};if(c.tabLocation==="top"||c.tabLocation==="bottom")d.css({left:c.leftPos}),c.tabHandle.css({right:0});c.tabLocation==="top"&&(d.css({top:"-"+e.containerHeight}),c.tabHandle.css({bottom:"-"+e.tabHeight})),c.tabLocation==="bottom"&&(d.css({bottom:"-"+e.containerHeight,position:"fixed"}),c.tabHandle.css({top:"-"+e.tabHeight}));if(c.tabLocation==="left"||c.tabLocation==="right")d.css({height:e.containerHeight,top:c.topPos}),c.tabHandle.css({top:0});c.tabLocation==="left"&&(d.css({left:"-"+e.containerWidth}),c.tabHandle.css({right:"-"+e.tabWidth})),c.tabLocation==="right"&&(d.css({right:"-"+e.containerWidth}),c.tabHandle.css({left:"-"+e.tabWidth}),a("html").css("overflow-x","hidden")),c.tabHandle.click(function(a){a.preventDefault()});var f=function(){c.tabLocation==="top"?d.animate({top:"-"+e.containerHeight},c.speed).removeClass("open"):c.tabLocation==="left"?d.animate({left:"-"+e.containerWidth},c.speed).removeClass("open"):c.tabLocation==="right"?d.animate({right:"-"+e.containerWidth},c.speed).removeClass("open"):c.tabLocation==="bottom"&&d.animate({bottom:"-"+e.containerHeight},c.speed).removeClass("open")},g=function(){c.tabLocation=="top"?d.animate({top:"-3px"},c.speed).addClass("open"):c.tabLocation=="left"?d.animate({left:"-3px"},c.speed).addClass("open"):c.tabLocation=="right"?d.animate({right:"-3px"},c.speed).addClass("open"):c.tabLocation=="bottom"&&d.animate({bottom:"-3px"},c.speed).addClass("open")},h=function(){d.click(function(a){a.stopPropagation()}),a(document).click(function(){f()})},i=function(){c.tabHandle.click(function(a){d.hasClass("open")?f():g()}),h()},j=function(){d.hover(function(){g()},function(){f()}),c.tabHandle.click(function(a){d.hasClass("open")&&f()}),h()},k=function(){f(),setTimeout(g,500)};c.action==="click"&&i(),c.action==="hover"&&j(),c.onLoadSlideOut&&k()}})(jQuery)