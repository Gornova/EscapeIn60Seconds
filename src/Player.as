package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.*;

	public class Player extends Entity
	{
		
		private const RIGHT:String = "right";
		private const LEFT:String = "left";
		private const UP:String = "up";
		private const DOWN:String = "down";
		
		private var prevx:int;
		private var prevy:int;
		
		public function Player(x:int, y:int) 
		{
			super(x, y);
			
			addGraphic(new Graphiclist(Global.imgPlayer, Global.imgBar3));
			
			setHitbox(32, 32);
			type = Global.PLAYER;
			
			Input.define(RIGHT, Key.RIGHT, Key.D);
			Input.define(LEFT, Key.LEFT, Key.A);
			Input.define(UP, Key.UP, Key.W);
			Input.define(DOWN, Key.DOWN, Key.S);
			
		}
		
		override public function update():void {
			super.update();
			
			var moved:Boolean = false;
			
			prevx = x;
			prevy = y;
			
			if (Input.pressed(RIGHT)) {
				if (x+32 < Global.width){
					moveBy(32, 0, Global.WALL);
					moved = true;
				}
			}
			
			if (Input.pressed(LEFT)) {
				if (x-32 >= 0){
					moveBy( -32, 0, Global.WALL);
					moved = true;					
				}
			}

			if (Input.pressed(UP)) {
				if (y-32 >= 0){
					moveBy(0, -32, Global.WALL);
					moved = true;					
				}
			}

			if (Input.pressed(DOWN)) {
				if (y+32 < Global.height){
					moveBy(0, 32, Global.WALL);
					moved = true;					
				}
			}
			
			if (moved) {
				Global.moves++;
				Global.playSndStep();
			}
		}
		
		public function back():void {
			x = prevx;
			y = prevy;
		}
		
		public function damage():void {
			Global.playSndHit();
			if (Global.life < 0) {
				FP.world.remove(this);
				Global.dead = true;
				return;
			}
			
			(graphic as Graphiclist).removeAll();
			(graphic as Graphiclist).add(Global.imgPlayer);
			(graphic as Graphiclist).add(Global.getbar(Global.life));
		}
		
		public function lifeUp():void {
			Global.life++;
			(graphic as Graphiclist).removeAll();
			(graphic as Graphiclist).add(Global.imgPlayer);
			(graphic as Graphiclist).add(Global.getbar(Global.life));
		}
		
		
		
	}

}