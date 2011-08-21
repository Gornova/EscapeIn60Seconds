package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class End extends Entity
	{
		
		public function End(x:int, y:int) 
		{
			super(x, y);
			graphic = new Image(Global.classEnd);
			
			setHitbox(32, 32);
			type = Global.END;			
			layer = 90;
		}
		
		override public function update():void {
			super.update();
			
			if (collideTypes(Global.PLAYER, x, y)) {
				(FP.world as GameWorld).nextLevel();
			}
		}
		
	}

}