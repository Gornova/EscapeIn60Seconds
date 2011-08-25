package
{

	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.system.Security;	
	
	import net.flashpunk.FP;
	import net.flashpunk.debug.Console;
	import net.flashpunk.Engine;
	import net.flashpunk.utils.Key;
	import splash.Splash;

	public class Main extends Engine
	{
		public function Main() 
		{
			super(480, 320, 60);
			
			
			try {
				// Pull the API path from the FlashVars
				var paramObj:Object = LoaderInfo(root.loaderInfo).parameters;

				// The API path. The "shadow" API will load if testing locally.
				var apiPath:String = paramObj.kongregate_api_path ||
					"http://www.kongregate.com/flash/API_AS3_Local.swf";

				// Allow the API access to this SWF
				Security.allowDomain(apiPath);

				// Load the API
				var request:URLRequest = new URLRequest(apiPath);
				var loader:Loader = new Loader();
				loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
				loader.load(request);
				this.addChild(loader);
			} catch (error:Error){
				onKongregate = false;
			}
			
		}
		
		override public function init():void 
		{
			//FP.console.enable();
			//FP.console.toggleKey = Key.BACKSPACE;
			//FP.world = new MenuWorld();
			
			//var s:Splash = new Splash;
			//FP.world.add(s);
			//s.start(splashComplete);
			
			FP.world = new GameWorld();
		}
		
		public function splashComplete():void
		{
			// This function is called when the splash screen finishes.
			FP.world = new MenuWorld();
		}
		

		// Kongregate API reference
		public static var kongregate:*;

		public static var isGuest:Boolean = true;

		public static var onKongregate:Boolean = false;

		public static var playerName:String = "";		
		
		// This function is called when loading is complete
		public	function loadComplete(event:Event):void
		{
			try {
				// Save Kongregate API reference
				kongregate = event.target.content;

				// Connect to the back-end
				kongregate.services.connect();

				// You can now access the API via:
				// kongregate.services
				// kongregate.user
				// kongregate.scores
				// kongregate.stats
				// etc...

				isGuest= kongregate.services.isGuest();
				if (!isGuest){
					playerName = kongregate.services.getUsername();
					onKongregate = true;					
				}
			} catch (error:Error){

			}
		}		
	}
}