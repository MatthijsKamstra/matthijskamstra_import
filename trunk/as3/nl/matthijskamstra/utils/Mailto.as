package nl.matthijskamstra.utils
{
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;

	/**
	 * ...
	 * @author Matthijs Kamstra aka [mck]
	 */
	public class Mailto 
	{
		
		public function Mailto (inMail:String, inSubject:String = null, inBody:String = null):void 
		{
			// mailto:recruitment@hero.nl?subject = Stage % 20lopen & body = Uw % 20reactie
			// This will pass the newline to the body of the email message:
			var mailMsg:URLRequest = new URLRequest("mailto:" + inMail);
			var variables:URLVariables = new URLVariables();
			if (inSubject != null) {
				variables.subject = inSubject
			}
			if (inBody != null) {
				variables.body = inBody;
			}
			mailMsg.data = variables;
			mailMsg.method = URLRequestMethod.GET;
			navigateToURL(mailMsg,'_self'); 
		}
		
	}
	
}