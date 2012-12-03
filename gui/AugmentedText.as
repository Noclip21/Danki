package gui
{
	import def.*;
	import prop.*;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	
	public class AugmentedText extends Prop
	{

		public function AugmentedText(posx		:Number,
									  posy		:Number,
									  string	:String,
									  W			:Number,
									  defColor	:uint)
		{
			var format :TextFormat = new TextFormat();
				format.font = "Segoe UI";
				format.size = 28;
				format.bold = true;
				format.color = defColor;
			var tf :TextField = new TextField();
				tf.text = string;
				tf.embedFonts = true;
				tf.setTextFormat(format);
				addChild(tf);
			
			super(new Point(posx,posy))
			
			move(new Point(posx,posy-100),0.3,function()
			{
				fade(-0.03,0,function()
				{
					kill();
				});
			});
		}

	}
	
}
