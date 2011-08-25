package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Tween;
	import net.flashpunk.tweens.misc.NumTween;
	import net.flashpunk.tweens.misc.VarTween;
	import net.flashpunk.utils.*;

	public class Player extends Entity
	{
		
		private const RIGHT:String = "right";
		private const LEFT:String = "left";
		private const UP:String = "up";
		private const DOWN:String = "down";
		
		private var prevx:int;
		private var prevy:int;
		
		private var move:Boolean;
		
		private var moveRight:Boolean;
		
		private var xcount:int = 0;
		
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
			var moved:Boolean = false;
			
			prevx = x;
			prevy = y;			

			if (Input.check(RIGHT)) {
				if (x+32 < Global.width && !collide(Global.WALL,x+2,y)){
					x = x +2;
					moved = true;
				}
			}	
			
			if (Input.check(LEFT)) {
				if (x+32 < Global.width && !collide(Global.WALL,x-2,y)){
					x = x - 2;
					moved = true;					
				}
			}				
			
			if (Input.check(UP)) {
				if (y-32 < Global.width && !collide(Global.WALL,x,y-2)){
					y = y -2;
					moved = true;					
				}			
			}

			if (Input.check(DOWN)) {
				if (y+32 < Global.width && !collide(Global.WALL,x,y+2)){
					y = y +2;
					moved = true;					
				}			
			}	
			
			if (moved) {
				Global.moves++;
				//Global.playSndStep();
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