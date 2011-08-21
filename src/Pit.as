package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class Pit extends Entity
	{
		
		public function Pit(x:int, y:int) 
		{
			super(x, y);
			graphic = new Image(Global.classPit);
			
			setHitbox(32, 32);
			type = Global.PIT;			
			
			layer = 99;
		}
		
		override public function update():void {
			super.update();
			
			var player:Entity = collideTypes(Global.PLAYER, x, y);
			if (player!=null) {
				Global.dead = true;
				FP.world.remove(player);
			}
		}
		
	}

}