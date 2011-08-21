package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.tweens.misc.Alarm;

	public class Goblin extends Enemy
	{
		
		public function Goblin(x:int, y:int) 
		{
			super(x, y, 2, new Image(Global.classGoblin));
			
			setHitbox(32, 32);
			type = Global.GOBLIN;					
		}
		
	}

}