package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.tweens.misc.Alarm;
	import net.flashpunk.graphics.Graphiclist;

	public class Enemy extends Entity
	{
		
		private var moveAlarm:Alarm;
		private var lastdx:Number;
		private var lastdy:Number;
		
		private var prevx:int;
		private var prevy:int;		
		
		private var life:int;
		
		private var g:Graphic;
		
		public function Enemy(x:int, y:int, life:int, graphic:Graphic) 
		{
			super(x, y);
			this.life = life;
			this.g = graphic;
			
			addGraphic(new Graphiclist(graphic, Global.getbar(life)));
			
			moveAlarm = new Alarm(1, onMove, LOOPING);			
			moveAlarm.start();
			addTween(moveAlarm);
		}
		
		override public function update():void {
			super.update();
			
			prevx = x;
			prevy = y;			
			
			var player:Entity = collideTypes(Global.PLAYER, x, y);
			if (player!=null) {
				Global.life -= 1;
				back();
				damage();
				(player as Player).back();
				(player as Player).damage();
				FP.world.add(new Blood(player.x, player.y));
				FP.world.add(new Blood(x, y));
			}
			
		}		
		
		public function back():void {
			x = prevx;
			y = prevy;
		}		
		
		public function onMove():void {
			var dx:Number = FP.random;
			var dy:Number = FP.random;
			
			if (dx != 0) {
				if (dx < 0.5) {
					// go left
					if (x-32 >=0){
						moveBy( -32, 0, [Global.WALL, Global.GLASS]);
						lastdx = -32;
					}
				} else {
					// go right
					if (x +32 < Global.width){
						moveBy(32, 0, [Global.WALL, Global.GLASS]);
						lastdx = 32;
					}
				}
			}
			if (dy != 0) {
				if (dy < 0.5) {
					// go up
					if (y-32 >=0){
						moveBy(0, -32, [Global.WALL, Global.GLASS]);
						lastdy = -32;
					}
				} else {
					// go down
					if (y+32 < Global.height){
						moveBy(0, 32, [Global.WALL, Global.GLASS]);
						lastdy = 32;
					}
				}
				
			}

		}		
		
		
		public function damage():void {
			life --;			
			if (life < 0) {
				FP.world.remove(this);
				return;
			}
			
			(graphic as Graphiclist).removeAll();
			(graphic as Graphiclist).add(g);
			(graphic as Graphiclist).add(Global.getbar(life));
			
			//if (Global.life == 3) {
				//(graphic as Graphiclist).add(Global.imgBar3);
			//}
			//if (Global.life == 2) {
				//(graphic as Graphiclist).add(Global.imgBar2);
			//}
			//if (Global.life == 1) {
				//(graphic as Graphiclist).add(Global.imgBar1);
			//}
			//if (Global.life == 0) {
				//(graphic as Graphiclist).add(Global.imgBar0);
			//}
			
			
		}		
	}

}