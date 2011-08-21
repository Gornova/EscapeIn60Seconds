package  
{
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import punk.ui.PunkLabel;	

	public class WinWorld extends World
	{
		
		private var winTime:int;
		
		public function WinWorld(time:int) 
		{
			winTime = time;
			
			add(new PunkLabel("YOU WIN!!", 200, 50));
			add(new PunkLabel("You have been escaped in " + time + " seconds", 100, 100));			
			add(new PunkLabel("With "+ Global.moves + " moves", 100, 120));			
			add(new PunkLabel("Press SPACE to continue!", 100, 200));						
			
			Input.define("goToMenu", Key.SPACE);
			
			if (Main.onKongregate){
				Main.kongregate.stats.submit("Moves", Global.moves);
				Main.kongregate.stats.submit("Time", winTime);
			}				
			
		}
		
		override public function update():void {
			super.update();
			
			if (Input.check("goToMenu")) {
				FP.world = new MenuWorld();
			}
		}
		
	}

}