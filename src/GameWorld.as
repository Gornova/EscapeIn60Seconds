package  
{
	import flash.utils.ByteArray;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;	
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.tweens.misc.Alarm;
	import net.flashpunk.World;

	public class GameWorld extends World
	{
		private var time:int;
		private var timer:Alarm;
		
		private var levels:Array = [Global.LEVEL1,Global.LEVEL2,Global.LEVEL3, Global.LEVEL4, Global.LEVEL5, Global.LEVEL6, Global.LEVEL7, Global.LEVEL8, Global.LEVEL9, Global.LEVEL10];
		
		private var text:Text;
		private var moves:Text;
		
		private var banner:Boolean = false;
		
		private var fadeAlarm:Alarm;		
		
		public function GameWorld() 
		{
			loadLevel(Global.levelIndex);
			
			timer = new Alarm(1, onTimer, LOOPING);			
			timer.start();
			addTween(timer);		
			
			Input.define("GoToMenu", Key.ESCAPE);
		}
		
		public function onTimer():void {
			time++;
			text.text = "TIME " + time;
		}

		public function loadLevel(index:int):void
		{

			addGraphic(Global.imgReady, -20, 0, 140);
			banner = true;
			fadeAlarm = new Alarm(1, onFadeAlarm, ONESHOT);			
			fadeAlarm.start();
			addTween(fadeAlarm);			
			
			
			addGraphic(Global.imgTimeBack, -9, 390, -5);
			text = new Text("TIME " + time, 400, 0)
			addGraphic(text, -10);
			
			addGraphic(new Image(Global.classTimeBack), -9, -10, 300);
			moves = new Text("MOVES " + Global.moves, 0, 300)
			addGraphic(moves,-10);
			
			
			for (var i:int = 0; i < 20; i++ ) {
				for (var j:int = 0; j < 15; j++ ) {
					add(new Tile(i * 32, j * 32));
				}
			}			
			
			//get the XML
			var file:ByteArray = new levels[index];
			var str:String=file.readUTFBytes(file.length);
			var xml:XML=new XML(str);

			//define some variables that we will use later on
			var e:Entity;
			var o:XML;
			var n:XML;

			//add walls
			for each (o in xml.objects[0].wall)
			{
				add(new Wall(o.@x, o.@y));
			}
			
			//add player at starting point
			for each (o in xml.objects[0].start)
			{
				add(new Player(o.@x, o.@y));
			}
			
			// add end
			for each (o in xml.objects[0].end)
			{
				add(new End(o.@x, o.@y));
			}
			
			// add spider
			for each (o in xml.objects[0].spider)
			{
				add(new Spider(o.@x, o.@y));
			}
			
			// add cyclope
			for each (o in xml.objects[0].cyclope)
			{
				add(new Cyclope(o.@x, o.@y));
			}			

			// add blob
			for each (o in xml.objects[0].blob)
			{
				add(new Blob(o.@x, o.@y));
			}			

			// add goblin
			for each (o in xml.objects[0].goblin)
			{
				add(new Goblin(o.@x, o.@y));
			}			
			
			// add redPotion
			for each (o in xml.objects[0].redPotion)
			{
				add(new RedPotion(o.@x, o.@y));
			}
			
			// add glass
			for each (o in xml.objects[0].glass)
			{
				add(new Glass(o.@x, o.@y));
			}				

			// add pit
			for each (o in xml.objects[0].pit)
			{
				add(new Pit(o.@x, o.@y));
			}				
			
			
		}
		
		public function nextLevel():void {
			removeAll();
			Global.life = 3;
			Global.levelIndex++;
			if (Global.levelIndex < 10) {
				
				if (Main.onKongregate){
					Main.kongregate.stats.submit("Moves",Global.moves);
				}				
				
				loadLevel(Global.levelIndex);
			} else {
				Global.gameWin = true;
				Global.levelIndex = 0;
			}
		}
		
		override public function update():void {
			if (Input.pressed("GoToMenu")) {
				FP.world = new MenuWorld();
			}
			
			if (!banner){
				super.update();

				moves.text = "MOVES " + Global.moves;
				
				if (Global.gameWin) {
					Global.levelIndex = 0;					
					FP.world = new WinWorld(time);
					return;
				}
				
				if (time > 60) {
					Global.levelIndex = 0;
					FP.world = new FailWorld(time);
					return;
				}
				
				if (Global.dead) {
					Global.dead = false;
					removeAll();				
					Global.life = 3;				
					loadLevel(Global.levelIndex);
				}
			}
			
		}
		
		public function onFadeAlarm():void {
			banner = false;
			var r:Array = new Array();
			getLayer( -20, r);
			removeList(r);
		}
	
	}
}