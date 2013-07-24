package
{
	import flash.text.TextField;
	
	public class NumberUtil
	{
		
		public static function generateRandomID():String
		{
			return String(new Date().getTime()) + int(Math.random() * 10000);
		}
	
		/**
		 * Gets a random number between a range provided
		 * @param Number Minimum to start from
		 * @param Number Maximum to go to
		 */ 
		public static function random(min:Number,max:Number):Number
		{
			return (Math.floor(Math.random() * (max - min + 1)) + min); 
		}
						
		/**
		 * Takes in a String (number in it) and puts comma's in the proper places.
		 * and returns the new string
		 * @param String (number) you want to make comma seperated
		 * @return String pretty comma seperated number
		 */ 
		public static function createCommaSeperatedNo(number:String):String
		{
			var finalText:String = "";	
			if(int(number) !=0)
			{
				for (var i:int = 0; i <number.length; i++) 
				{
					if(i%3 == 0 && i!=number.length && i!=0)
					{
						finalText = "," + finalText;
					}
					finalText = number.charAt(number.length - (i+1))+ finalText;
				}
			}else
			{	
				finalText = "0";
			}
			return finalText;
		}
		
		/**
		 * Inserts Padding of zero's and returns a new string. 
		 * @param Number you want to padd and convert
		 * @param Number, total Length of output string that you want.
		 */  
		public static function paddWithZeros(toConvert:int,totalStringLength:int):String
		{
			var myString:String = String(toConvert);
			var howless:int = 0;
			var finalString:String = "";
			if(myString.length < totalStringLength)
			{
				howless = totalStringLength - myString.length;
				for(var i:uint=0;i<howless;i++)
				{
					finalString += "0";
				}
			}
			
			finalString += myString;
			return finalString;
		}
		
		/**
		 * Takes a Number and converts it to the given length e.g 2456 with len 2 : 24 . 2456 with length 5 : 02456
		 * @param Number you want to convert
		 * @param len the length of Number you want to achieve
		 * @return String with length len
		 */ 
		public static function fixedNumberLength(toConvert:Number,len:int):String
		{
			var myString:String = toConvert.toString();
			
			if(myString.length < len)
				return paddWithZeros(toConvert,len);
			
			return myString.slice(0,len);
		}
		
		/**
		 * Rounds Numbers to Decimal Places
		 * @param Number you want to Round Off
		 * @param Number of decimal places you want to round the number to
		 * @return Number Rounded to decimals answer
		 */ 
		public static function roundDecimal(num:Number, decimals:Number=2):Number
		{
			var t:Number = Math.pow(10, decimals);
			return Math.round(t * num) / t;
		}
				
		/**
		 * Returns currency symbol in ASCII (encoded in a string). Returns $
		 * 
		 * @param Currency Code defined internationally (EUR for euro etc)
		 * @return Returns currency symbol encoded in a string ($ for dallar)
		 */
		public static function getCurrencySymbol(currencyCode:String):String
		{
			var currencySymbol:String = "";
			switch(currencyCode)
			{					
				case "SGD":
				case "HKD":
				case "CAD":
				case "MXN":
				case "NZD":
				case "USD":{currencySymbol = "$";	break;}
					
				case "SEK":
				case "NOK":
				case "RON":
				case "DKK":{currencySymbol = "kr";	break;}

				case "AUD":{currencySymbol = "A$";	break;}
				case "BHD":{currencySymbol = "BD"; 	break;}
				case "BRL":{currencySymbol = "R$"; 	break;}
				case "COP":{currencySymbol = "COL$";break;}
				case "HRK":{currencySymbol = "kn"; 	break;}
				case "HNL":{currencySymbol = "L"; 	break;}
				case "HUF":{currencySymbol = "Ft"; 	break;}
				case "IDR":{currencySymbol = "Rp";	break;}
				case "LVL":{currencySymbol = "Ls";	break;}
				case "LBR":{currencySymbol = "L"; 	break;}
				case "LTR":{currencySymbol = "ct"; 	break;}
				case "MYR":{currencySymbol = "RM"; 	break;}
				case "PLN":{currencySymbol = "zt"; 	break;} // 142
				case "RUB":{currencySymbol = "RUB"; break;} // руб 440, 443, 431
				case "SAR":{currencySymbol = "SR"; 	break;}
				case "ZAR":{currencySymbol = "R"; 	break;}
				case "CHF":{currencySymbol = "CHF";	break;}
				case "TWD":{currencySymbol = "NT$"; break;}
				case "TRY":{currencySymbol = "L";	break;}
				case "AED":{currencySymbol = "DH";	break;}
				case "THB":{currencySymbol = "B"; break;}			//String.fromCharCode(0x0e3f);
					
				case "PHP":{currencySymbol = String.fromCharCode(0x20b1); break;}
				case "UAH":{currencySymbol = String.fromCharCode(0x20b4); break;}	
				case "BGN":{currencySymbol = "lev"; break;} // String.fromCharCode(0x043b) + "B"
				case "EUR":{currencySymbol = String.fromCharCode(0x20AC); break;}
				case "CZK":{currencySymbol = "k" + String.fromCharCode(0x010d); break;} // small c
				case "ILS":{currencySymbol = String.fromCharCode(0x20AA); break;}
				case "KRW":{currencySymbol = String.fromCharCode(0x20a9); break;}
				case "GBP":{currencySymbol = String.fromCharCode(0x00A3); break;}
			}
			
			if(currencySymbol == "")
			{
				currencySymbol = "$";
			}			
			
			return currencySymbol;
		}
				
		/**
		 * Picks a random number from an array of numbers
		 */ 
		public static function randomFromArray(array:Array):*
		{
			var index:uint = Math.floor(Math.random()*array.length);			
			return array[index];
		}
		
		
		/**
		 * Gives X percent random numbers from an array
		 * @param array From which the items are to be selected
		 * @param percent The percentage of items you want from the array. 
		 * @return Array of items
		 */ 
		public static function randomPercentFromArray(array:Array,percent:uint):Array
		{
			var arrayCopy:Array = array.concat();
			var numOfItemsToSelect:uint = Math.round(percent*0.01*arrayCopy.length)
			var random:uint = 0;
			var index:uint = arrayCopy.length-1;
			var selected:*;
				
			for (var i:int = 0; i < numOfItemsToSelect; i++) 
			{
				random = Math.floor(Math.random()*index);
				selected = arrayCopy[random];
				arrayCopy[random] = arrayCopy[index];
				arrayCopy[index]  = selected;
				
				index--;				
			}
			
			return arrayCopy.slice(0,numOfItemsToSelect);
		}
	}
}