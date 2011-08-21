package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;

	public class Tile extends Entity
	{
		
		public function Tile(x:int, y:int) 
		{
			super(x, y);
			graphic = new Image(Global.classTile);
			collidable = false;
			layer = 100;
			
		}
		
	}

}