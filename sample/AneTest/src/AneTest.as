package
{
	import com.alanogames.ane.Rating;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;
	
	import fl.controls.Button;
	
	public class AneTest extends Sprite
	{
		/**
		 * Rating.ane Test
		 * */
		public function AneTest()
		{
			super();
			// 支持 autoOrient
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			
			// Rating Test
			Rating.daysUntilPrompt = 0;
			Rating.packageName = "air.com.summernn.balloonbang.gp";
			Rating.applicationName = "Balloon Bang";
			
			//Rating.messageTitle = "MSG TITLE";
			//Rating.message = "Message Body";
			
			trace("lh___set:"+Rating.packageName);
			Rating.applicationLaunched();
			Rating.previewMode = true;// 这句是关键哦，否则不会开启
			trace("lh___get:"+Rating.packageName);
			
			
			addUI();
		}
		
		private function addUI():void
		{
			var loginBtn:Button=new Button();
			loginBtn.label="Ratings";
			loginBtn.setSize(200,40);
			loginBtn.x = 30;
			loginBtn.y = 30;
			loginBtn.addEventListener(MouseEvent.CLICK,onClick);
			this.addChild(loginBtn);
		}
		
		private function onClick(event:MouseEvent):void
		{
			trace("Button onClick");
			trace("lh___:"+Rating.packageName);
			trace("lh___:"+Rating.applicationBundleID);
			trace("lh___:"+Rating.shouldPromptForRating()+"|"+Rating.previewMode);
			trace("lh___:"+Rating.isSupported());
			if(Rating.shouldPromptForRating())
			{
				trace("should Prompt For Rating");
				Rating.promptIfNetworkAvailable();
			}
		}
	}
}