package  
{

	import net.flashpunk.World;
	import net.flashpunk.FP;	
	import net.flashpunk.utils.Key;
	import punk.ui.PunkButton;
	import punk.ui.PunkLabel;	
	import punk.ui.PunkUI;	
	import punk.ui.skins.RolpegeBlue;
	
	public class MenuWorld extends World
	{
		
		public function MenuWorld() 
		{
			Global.moves = 0;
		
			add(new PunkLabel("ESCAPE IN 60 SECONDS", 150, 30));
			add(new PunkLabel("You must escape in 60 seconds from dungeon", 30, 60));
			add(new PunkLabel("Before BOMB explode! RUNN!!!!", 120, 80));			
			add(new PunkLabel("Controls: WASD or arrows", 120, 130));						
			
			add(new PunkButton(190, 180, 100, 50, "PLAY", onClickPlay, Key.SPACE));
			
			if (Main.onKongregate && Main.playerName != null) {
				add(new PunkLabel("Logged as "+Main.playerName, 120, 280));						
			}
			
			
			add(new PunkLabel("http://randomtower.blogspot.com - 2011 for LD21", 25, 300));						
		}
		
		public function onClickPlay():void {
			FP.world = new GameWorld();
		}
		
	}

}