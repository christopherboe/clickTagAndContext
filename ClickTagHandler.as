package {
    import flash.display.Sprite;

    import flash.ui.ContextMenuItem;
    import flash.events.ContextMenuEvent;
    import flash.net.URLRequest;

    class ClickTagHandler {

        // Variables
        protected var interactiveObject:InteractiveObject;
        protected var li:LoaderInfo;
        protected var url:String;

        public var targetBtn:Sprite;
        
        // Constructor
        public function ClickTagHandler(targetBtn:Sprite) {

            this.interactiveObject = mouseEvent.target as InteractiveObject;
            this.li = LoaderInfo(interactiveObject.root.loaderInfo);
            this.url = li.parameters.clickTag;

            // Set the target btn
            this.targetBtn = targetBtn;

            // Run initial function 
            this.init();
        }

        // Init function
        protected function init() {
            // Add Eventlistener for mouse up event
            this.targetBtn.addEventListener(MouseEvent.MOUSE_UP,handleClick);
        }

        protected function handleClick(mouseEvent:MouseEvent):void {
            
            if (this.url) {
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

    }
}


