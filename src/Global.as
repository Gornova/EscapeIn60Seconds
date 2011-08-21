package  
{
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Sfx;

	public class Global
	{
		
		public function Global(){}
		
		/** Vars **/
		public static var life:int = 3;
		public static var dead:Boolean = false;
		public static const width:int = 480;
		public static const height:int = 320;
		public static var gameWin:Boolean = false;		
		public static var moves:int = 0;
		
		/** Types **/
		public static const PLAYER:String = "player";
		public static const WALL:String = "wall";
		public static const SPIDER:String = "spider";
		public static const CYCLOPE:String = "cyclope";
		public static const BLOB:String = "blob";
		public static const GOBLIN:String = "goblin";
		public static const RED_POTION:String = "redPotion";
		public static const END:String = "end";
		public static const GLASS:String = "glass";
		public static const PIT:String = "pit";
		
		
		/* Assets */
		[Embed(source = 'data/player.png')]
		public static const classPlayer:Class;
		public static var imgPlayer = new Image(Global.classPlayer);
		[Embed(source = 'data/spider.png')]
		public static const classSpider:Class;
		[Embed(source = 'data/blood.png')]
		public static const classBlood:Class;
		[Embed(source = 'data/cyclope.png')]
		public static const classCyclope:Class;
		[Embed(source = 'data/blob.png')]
		public static const classBlob:Class;
		[Embed(source = 'data/goblin.png')]
		public static const classGoblin:Class;
		

		[Embed(source = 'data/wall.png')]
		public static const classWall:Class;
		[Embed(source = 'data/tile.png')]
		public static const classTile:Class;
		[Embed(source = 'data/redPotion.png')]
		public static const classRedPotion:Class;
		[Embed(source = 'data/end.png')]
		public static const classEnd:Class;
		[Embed(source = 'data/glass.png')]
		public static const classGlass:Class;
		[Embed(source = 'data/pit.png')]
		public static const classPit:Class;		
		
		
		
		[Embed(source = 'data/bar3.png')]
		public static const classBar3:Class;
		public static var imgBar3 = new Image(Global.classBar3);
		[Embed(source = 'data/bar2.png')]
		public static const classBar2:Class;
		public static var imgBar2 = new Image(Global.classBar2);		
		[Embed(source = 'data/bar1.png')]
		public static const classBar1:Class;
		public static var imgBar1 = new Image(Global.classBar1);		
		[Embed(source = 'data/bar0.png')]
		public static const classBar0:Class;
		public static var imgBar0 = new Image(Global.classBar0);		
		
		[Embed(source = 'data/bar.png')]
		public static const classBarra:Class;				
		public static var imgBarra = new Image(Global.classBarra);		
		[Embed(source = 'data/ready.png')]
		public static const classReady:Class;				
		public static var imgReady = new Image(Global.classReady);				
		[Embed(source = 'data/timeBack.png')]
		public static const classTimeBack:Class;				
		public static var imgTimeBack = new Image(Global.classTimeBack);
		
		/** Sounds **/
		[Embed(source="/data/redPotion.mp3")]
		public static var classPotion:Class;		
		public static var sndPotion:Sfx = new Sfx(classPotion);		
		[Embed(source="/data/step.mp3")]
		public static var classStep:Class;		
		public static var sndStep:Sfx = new Sfx(classStep);		
		[Embed(source="/data/hit.mp3")]
		public static var classHit:Class;		
		public static var sndHit:Sfx = new Sfx(classHit);				
		
		/** Levels **/
		[Embed(source = 'data/levels/level1.oel',  mimeType = "application/octet-stream")] 
		public static const LEVEL1: Class;
		[Embed(source = 'data/levels/level2.oel',  mimeType = "application/octet-stream")] 
		public static const LEVEL2: Class;
		[Embed(source = 'data/levels/level3.oel',  mimeType = "application/octet-stream")] 
		public static const LEVEL3: Class;
		[Embed(source = 'data/levels/level4.oel',  mimeType = "application/octet-stream")] 
		public static const LEVEL4: Class;
		[Embed(source = 'data/levels/level5.oel',  mimeType = "application/octet-stream")] 
		public static const LEVEL5: Class;
		[Embed(source = 'data/levels/level6.oel',  mimeType = "application/octet-stream")] 
		public static const LEVEL6: Class;
		[Embed(source = 'data/levels/level7.oel',  mimeType = "application/octet-stream")] 
		public static const LEVEL7: Class;
		[Embed(source = 'data/levels/level8.oel',  mimeType = "application/octet-stream")] 
		public static const LEVEL8: Class;
		[Embed(source = 'data/levels/level9.oel',  mimeType = "application/octet-stream")] 
		public static const LEVEL9: Class;
		[Embed(source = 'data/levels/level10.oel',  mimeType = "application/octet-stream")] 
		public static const LEVEL10: Class;
		
		
		public static var levelIndex:int = 0;
		
		/** Utils **/
		public static function getbar(life:int):Graphic {
			if (life >= 3) {
				return Global.imgBar3;
			}
			if (life == 2) {
				return Global.imgBar2;
			}
			if (life == 1) {
				return Global.imgBar1;
			}
			if (life == 0) {
				return Global.imgBar0;
			}
			return null;
		}
		
		/**
		 * Sound utilities
		 */
		public static function playSndPotion():void {
			sndPotion.play();
		}	
		
		public static function playSndStep():void {
			sndStep.play();
		}	
		
		public static function playSndHit():void {
			sndHit.play();
		}			
				
		
	}

}