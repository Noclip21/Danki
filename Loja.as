package
{
	
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.geom.Point;
	import flash.text.TextFormat;
	import flash.events.Event;
	
	
	public class Loja extends BaseMc
	{
		
		var totalBits :Number;
		
		
		public function Loja()
		{
			
		}
		public function dmg(money,client)
		{
			totalBits += money;
			var bits = client.bits;
			client.bits = 0;
			
			var format :TextFormat = new TextFormat();
				format.font = "Verdana";
				format.size = 30;
				format.bold = true;
				format.color = 0x333;
			var tf :TextField = new TextField();
				tf.text = '$ '+bits;
				tf.embedFonts = true;
				tf.setTextFormat(format);
			var holderTf = new BaseMc();
				holderTf.x = client.x;
				holderTf.y = client.y - client.height;
				holderTf.addChild(tf);
			parent.addChild(holderTf);

			Utils.move(holderTf,new Point(holderTf.x,holderTf.y - 50),0.2);
			Utils.fade(holderTf,-0.05,function(){ Utils.kill(holderTf); });
		}
	}
	
}
