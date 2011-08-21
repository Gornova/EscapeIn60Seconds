package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class Cyclope extends Enemy
	{
		
		public function Cyclope(x:int, y:int) 
		{
			super(x, y,3,new Image(Global.classCyclope));
			
			setHitbox(32, 32);
			type = Global.CYCLOPE;					
		}
		
	}

}