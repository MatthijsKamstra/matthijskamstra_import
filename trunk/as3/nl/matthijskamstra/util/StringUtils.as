


// StringUtils.stringToBoolean(images.options.effects.@useDropShadow);


public static function stringToBoolean($string:String):Boolean
{
    return ($string.toLowerCase() == "true" || $string.toLowerCase() == "1");
} 