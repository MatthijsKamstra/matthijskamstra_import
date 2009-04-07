/**
 <script language="Javascript" type="text/javascript">
//<![CDATA[
document.write(mailhref);
//]]>
</script> 


**/

var gebruikersnaam = "info";
var domeinnaam = "metvollehanden";
var extensie = "nl";
var onderwerp = escape("");
var bodytekst = escape(""); 

var mailhref = '<a href=\"mailto:' + gebruikersnaam + '@' + domeinnaam +'.'
+ extensie + '\">' + gebruikersnaam + '@' + domeinnaam +'.'
+ extensie +  '</a>';

var mailhrefuitgebreid = '<a href=\"mailto:' + gebruikersnaam + '@' + domeinnaam +'.'
+ extensie + '?subject=' + onderwerp + '&body=' + bodytekst + '\">email</a>';
