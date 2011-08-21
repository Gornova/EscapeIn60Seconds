package  
{
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import punk.ui.PunkLabel;	

	public class FailWorld extends World
	{
		
		private var failTime:int;
		
		public function FailWorld(time:int) 
		{
			failTime = time;
			
			add(new PunkLabel("YOU LOSE", 200, 50));
			add(new PunkLabel("Time ran out! Your time : "+failTime, 100, 100));			
			add(new PunkLabel("Press SPACE to continue!", 100, 200));						
			
			Input.define("goToMenu", Key.SPACE);
			
			if (Main.onKongregate){
				Main.kongregate.stats.submit("Moves", Global.moves);
				Main.kongregate.stats.submit("Time", failTime);
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