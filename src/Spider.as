package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.tweens.misc.Alarm;

	public class Spider extends Enemy
	{
		
		public function Spider(x:int, y:int) 
		{
			super(x, y, 1, new Image(Global.classSpider));
			
			setHitbox(32, 32);
			type = Global.SPIDER;					
		}
		
	}

}