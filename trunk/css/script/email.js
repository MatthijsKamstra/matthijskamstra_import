/**
 <script language="Javascript" type="text/javascript">
//<![CDATA[
document.write(mailhref);
//]]>
</script> 


**/

var gebruikersnaam = "foo";
var domeinnaam = "bar";
var extensie = "nl";
var onderwerp = escape("");
var bodytekst = escape(""); 

var mailhref = '<a href=\"mailto:' + gebruikersnaam + '@' + domeinnaam +'.' + extensie + '\">' + gebruikersnaam + '@' + domeinnaam +'.' + extensie +  '</a>';

var mailhrefuitgebreid = '<a href=\"mailto:' + gebruikersnaam + '@' + domeinnaam +'.' + extensie + '?subject=' + onderwerp + '&body=' + bodytekst + '\">email</a>';



/**
example:
<a href="#" onclick="writeEmail('name', 'foobar', 'nl', 'subject', 'bodytext');return false;" target="_self" alt="Meld je aan bij Anita Sannes" />
*/
function writeEmail (gebruikersnaam, domeinnaam, extensie, onderwerp , bodytekst)
{
	// alert ('writeEmail');
	document.location.href = 'mailto:' + gebruikersnaam + '@' + domeinnaam +'.' + extensie + '?subject=' + onderwerp + '&body=' + bodytekst;
}
