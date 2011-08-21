package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;

	public class Wall extends Entity
	{
		
		public function Wall(x:int, y:int) 
		{
			super(x, y);
			graphic = new Image(Global.classWall);
			
			setHitbox(32, 32);
			type = Global.WALL;			
		}
		
	}

}