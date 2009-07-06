// borrowed from the Gaia Framework for Adobe Flash ©2007-2009
// excelent work by: Steven Sacks
package nl.matthijskamstra.utils
{
	public class CacheBuster
	{
		public static var isOnline:Boolean = false;
		
		public static function create(url:String):String
		{
			if (isOnline) 
			{
				var d:Date = new Date();
				var nc:String = "nocache=" + d.getTime();
				if (url.indexOf("?") > -1) return url + "&" + nc;
				return url + "?" + nc;
			}
			return url;
		}
	}
}