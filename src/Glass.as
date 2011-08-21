package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;

	public class Glass extends Entity
	{
		
		public function Glass(x:int, y:int) 
		{
			super(x, y);
			graphic = new Image(Global.classGlass);
			
			setHitbox(32, 32);
			type = Global.GLASS;			
		}
		
	}

}