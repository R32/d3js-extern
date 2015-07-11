package js.d3;
import js.d3.Color.Rgb;


/**
A d3.color base type is provided if you want to extend D3 with additional color spaces. This type enables automatic RGB interpolation by d3.interpolate (detected via instanceof d3.color).
*/
@:native("d3.color") extern class Color {
	/**
	Returns the RGB equivalent of this color. Must be implemented by all color spaces.
	*/	
	function rgb():Rgb;
	
	/**
	Converts this RGB color to a hexadecimal string, such as "#f7eaba".
	*/
	function toString():String;
}

extern class ColorBright<T> extends Color{
	/**
	Returns a brighter copy of this color. The lightness channel is multiplied by 0.7 ^ -k. If the gamma value k is omitted, it defaults to 1.
	*/
	function brighter(?k:Float):T;
	
	/**
	Returns a darker copy of this color. The lightness channel is multiplied by 0.7 ^ k. If the gamma value k is omitted, it defaults to 1.
	*/
	function darker(?k:Float):T;
}

extern class Rgb extends ColorBright<Rgb> {
	
	var r:Int;
	
	var g:Int;
	
	var b:Int;
	
	/**
	Returns a brighter copy of this color. Each channel is multiplied by `0.7 ^ -k`. If the gamma value k is omitted, it defaults to 1. Channel values are capped at the maximum value of 255, and the minimum value of 30.
	*/
	override function brighter(?k:Float):Rgb;
	
	
	override inline function rgb():Rgb return this;
	
	/**
	Returns the equivalent color in HSL space; see d3.hsl for details on the returned object. The conversion from HSL to RGB is described in CSS3 Color Module Level 3; this is the equivalent reverse operation. 
	*/
	function hsl():Hsl;
}



extern class Hsl extends ColorBright<Hsl>{
	var h:Int;
	
	var s:Float;
	
	var l:Float;
}

extern class Hcl extends ColorBright<Hcl>{
	var h:Float;
	
	var c:Float;
	
	var l:Float;
}

extern class Lab extends ColorBright<Lab>{
	var l:Float;
	
	var a:Float;
	
	var b:Float;
}