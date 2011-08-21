package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.tweens.misc.Alarm;

	public class Blood extends Entity
	{
		private var fadeAlarm:Alarm;
		private var fade:Boolean;
		
		public function Blood(x:int, y:int) 
		{
			super(x, y);
			graphic = new Image(Global.classBlood);
			collidable = false;
			
			fadeAlarm = new Alarm(0.5, onfadeAlarm, ONESHOT);			
			fadeAlarm.start();
			addTween(fadeAlarm);
		}
		
		public function onfadeAlarm():void {
			fade = true;
		}
		
		override public function update():void {
			super.update();
			
			if ((graphic as Image).alpha <= 0) {
				FP.world.remove(this);
			}
			
			if (fade) {
				(graphic as Image).alpha -= 0.1;
			}
		}
		
		
		
	}

}