package whiterabbit.utils
{
	import core.debug.Debug;
	
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextLineMetrics;
	
	import whiterabbit.constants.GameConstants;

	public class TextUtil
	{
		
		
		public function TextUtil()
		{
		}
		
		/**
		 * The function fixes the height and y-cordinate of a textfield wrt text.
		 *  
		 * - Increases height of textfield to fit text
		 * - Fixes y-cordinate so field is always aligned 
		 * 
		 * <b>note: </b> Calling alignFix over and over for a single field may result in wrong y-cordinate fix
		 * <b>note: </b> Textfield must be multi-line and wrap enabled. Not fixed if not true
		 * 
		 * @param textfield You want to fix
		 * @returns Fixes the original object returns nothing
		 */
		public static function alignFix(textfield:TextField):void
		{			
			if(textfield.wordWrap == false || !textfield.multiline == false || textfield.text=="")
			{
				return
			}
			
			var textlinemetric:TextLineMetrics 	= textfield.getLineMetrics(0);
			var lineheight:int 	= (textlinemetric.ascent + textlinemetric.descent + textlinemetric.leading*2);
			
			if(textfield.numLines >1)
			{
				textfield.height = lineheight * textfield.numLines;
				textfield.y		= textfield.y - (textfield.height - lineheight);
			}
		}
		
		/**
		 * The function fixes the height of a textfield wrt text.
		 *  
		 * - Increases height of textfield to fit text
		 * 
		 * <b>note: </b> Calling alignFix over and over for a single field may result in wrong y-cordinate fix
		 * <b>note: </b> Textfield must be multi-line and wrap enabled. Not fixed if not true
		 * 
		 * @param textfield You want to fix
		 * @returns Fixes the original object returns nothing
		 */
		public static function heightFix(textfield:TextField):void
		{
			if(!textfield.wordWrap || !textfield.multiline || textfield.text=="")
			{
				return
			}
			
			var textlinemetric:TextLineMetrics 	= textfield.getLineMetrics(0);
			var lineheight:int 	= (textlinemetric.ascent + textlinemetric.descent + textlinemetric.leading*2);
			
		
			if(textfield.numLines >1)
			{
				textfield.height = lineheight * textfield.numLines;
			}
		}
		
		/**
		 * Send in a textfield and embed the dynamic font (that the text field contains)
		 * This is a fix for disappearing text
		 * @param TextField to format
		 * @param String AutoTextAlign to set the alignment if needed
		 */
		public static function applyFormat(textField:TextField,align:String=null):Boolean
		{
			if(textField == null)
			{
				Debug.warn("TextUtil","TextField is null");
				return false;
			}
			
			var formatting:TextFormat = textField.defaultTextFormat;
			
			switch(formatting.font)
			{
				case GameConstants.JOINT:
				case GameConstants.GROBOLD:
				case GameConstants.PLAYTIME:
				case GameConstants.KOMICA:
				case GameConstants.HAPPYHELL:
				case GameConstants.CALIBRI:
				case GameConstants.MYRIAD:
				case GameConstants.BADABOOM:
					CONFIG::debug{Debug.log("TextUtil","textfield already formatted: ",textField);}
					return false;
					break;					
			}
						
			switch(formatting.font)
			{
				case "Joint by PizzaDude":
					formatting.font = GameConstants.JOINT;
					break;
				case "GROBOLD":
					formatting.font = GameConstants.GROBOLD;
					break;
				case "Playtime With Hot Toddies":
					formatting.font = GameConstants.PLAYTIME;
					break;
				case "Happy Hell":
					formatting.font = GameConstants.HAPPYHELL;
					break;
				case "Komika Axis":
					formatting.font = GameConstants.KOMICA;
					break;				
				case "Calibri":
					formatting.font = GameConstants.CALIBRI;
					break;				
				case "Myriad Pro":
					formatting.font = GameConstants.MYRIAD;
					break;
				case "BadaBoom BB":
					formatting.font = GameConstants.BADABOOM;
					break;
				default:
					Debug.warn("TextUtil", "Cannot Recognize Font, assigning Grobold");
					textField.selectable = false;
					//formatting.color = 0xffffff;
					//formatting.align = "left";
					formatting.font = GameConstants.GROBOLD;
					break;
			}
			
			textField.defaultTextFormat	= formatting;
			textField.embedFonts 		= true;
			
			if(align)
			{
				textField.autoSize 		= align;
			}
			
			return true;
		}
		
		public static function strikeThroughSingleLine(tf:TextField,add:Boolean=false):TextField
		{
			var strikeField:TextField=new TextField(); 
			
			if(tf.length <= 0)
			{
				strikeField.text = "";
				return strikeField;
			}			

			strikeField.text = "_";
			
			for(var i:int = 1; i < tf.length; i++)
			{
				strikeField.appendText("_"); 
			}
			
			
			
			strikeField.setTextFormat(tf.getTextFormat());
			
			var format1:TextFormat = new TextFormat(); 
				format1.bold = true; 
				
			strikeField.setTextFormat(format1);
			strikeField.defaultTextFormat 	= strikeField.getTextFormat();			
			strikeField.x 				  	= tf.x + 2;
			strikeField.y 					= tf.y - Number(tf.getTextFormat().size) / 2;
			strikeField.width 				= tf.width;
			strikeField.height 				= tf.height;
			strikeField.selectable 			= false;
			
			if(add)
			{
				tf.parent.addChild(strikeField);				
			}
			
			return strikeField;

		}
		
		/**
		 * Capitalizes the first charecter of a string and returns the Capitalized string. Example 'something' returns 'Something'
		 * @param String Text you want to Capitalize 'something'
		 * @return String Capitalized first charecter string 'Something'
		 */ 
		public static function capitalizeFirstChar(text:String):String
		{
			if(text == '' || text == ' ')
			{
				return '';
			}
			
			var finalText:String 	= text.charAt(0);
				finalText 			= finalText.toUpperCase();
				finalText 			= finalText.concat(text.substring(1));
				
			return finalText;
		}
		
	}
}