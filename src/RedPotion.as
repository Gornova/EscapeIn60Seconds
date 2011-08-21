package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.tweens.misc.Alarm;	

	public class RedPotion extends Entity
	{
		
		private var fade:Boolean;		
		
		public function RedPotion(x:int, y:int) 
		{
			super(x, y);
			graphic = new Image(Global.classRedPotion);
			
			setHitbox(32, 32);
			type = Global.RED_POTION;			
			
		}
		
		override public function update():void {
			super.update();
			
			if ((graphic as Image).alpha <= 0) {
				Global.playSndPotion();
				FP.world.remove(this);
				return ;
			}
			
			if (fade) {
				(graphic as Image).alpha -= 0.1;
			} else {			
				var pl:Entity = collideTypes(Global.PLAYER, x, y);
				if (pl!= null) {
					(pl as Player).lifeUp();
					fade = true;
				}
			}
		}
		
	}

}