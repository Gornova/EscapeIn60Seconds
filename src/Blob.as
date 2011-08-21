package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.tweens.misc.Alarm;

	public class Blob extends Enemy
	{
		
		public function Blob(x:int, y:int) 
		{
			super(x, y,2,new Image(Global.classBlob));
			
			setHitbox(32, 32);
			type = Global.BLOB;					
		}
		
	}

}