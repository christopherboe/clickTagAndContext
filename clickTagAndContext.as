import flash.ui.ContextMenuItem;
import flash.events.ContextMenuEvent;
import flash.net.URLRequest;


//CLICKTAG

function handleClick(mouseEvent:MouseEvent):void {

    var interactiveObject:InteractiveObject = mouseEvent.target as InteractiveObject;
    var li:LoaderInfo = LoaderInfo(interactiveObject.root.loaderInfo);
    var url:String = li.parameters.clickTag;
    
    if (url) {
        if (ExternalInterface.available) {
            var userAgent:String = ExternalInterface.call('function(){ return navigator.userAgent; }');

            if (userAgent.indexOf("MSIE") >= 0) {
                ExternalInterface.call('window.open', url, '_blank');
            } else {
                navigateToURL(new URLRequest(url), '_blank');
            }
        } else {
            navigateToURL(new URLRequest(url), '_blank');
        }
    }
    
}

clickTag_btn.addEventListener(MouseEvent.MOUSE_UP,handleClick);



//CONTEXT MENU

var adContextMenu:ContextMenu = new ContextMenu();
adContextMenu.hideBuiltInItems();

var made_by = new ContextMenuItem("Laget av: Christopher Bøe");

function openLink(e:ContextMenuEvent):void{
	trace("OPENING LINK");
	navigateToURL(new URLRequest("http://www.staysteezy.com"), "_blank");
}

made_by.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, openLink);

adContextMenu.customItems.push(made_by);

contextMenu = adContextMenu;
