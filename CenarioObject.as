package
{
	
	public class CenarioObject extends BaseMc
	{

		public function CenarioObject()
		{
			
		}
		
		public function CenarioObject_display()
		{
			if(parent)
				for(var i=0; i<parent.numChildren; i++)
					if(parent.getChildAt(i).y <= y)
					if(parent.getChildIndex(parent.getChildAt(i)) > parent.getChildIndex(this))
						parent.swapChildren(this,parent.getChildAt(i));
			
			BaseMc_display();
		}
		override public function display()
		{
			CenarioObject_display();
			BaseMc_display();
		}

	}
	
}
