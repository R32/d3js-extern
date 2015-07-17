package js.d3.scales;


/**
Quantize scales are a variant of linear scales with a discrete rather than continuous range. The input domain is still continuous, and divided into uniform segments based on the number of values in (the cardinality of) the output range. The mapping is linear in that the output range value y can be expressed as a linear function of the input domain value x: y = mx + b. The input domain is typically a dimension of the data that you want to visualize, such as the height of students (measured in meters) in a sample population. The output range is typically a dimension of the desired output visualization, such as the height of bars (measured in pixels) in a histogram. 
*/
extern class Quantize{
	
	/**
	Given a value x in the input domain, returns the corresponding value in the output range.
	
	```js
	var q = d3.scale.quantize().domain([0, 1]).range(['a', 'b', 'c']);
	q(0.3) === "a"; 		// haxe: q.selfCall(0.3) == "a"
	```
	*/
	@:selfCall function selfCall(x:Float):Dynamic;
	
	/**
	Returns the extent of values in the input domain [x0, x1] for the corresponding value in the output range y, representing the inverse mapping from range to domain. 
	
	This method is useful for interaction, say to determine the value in the input domain that corresponds to the pixel location under the mouse. 
	
	`q.invertExtent('a') == [0, 0.3333333333333333]`
	*/
	function invertExtent(y:Dynamic):Array<Float>;
	
	/**
	If numbers is specified, sets the scale's input domain to the specified two-element array of numbers. If the array contains more than two numbers, only the first and last number are used. If the elements in the given array are not numbers, they will be coerced to numbers; this coercion happens similarly when the scale is called. Thus, a quantize scale can be used to encode any type that can be converted to numbers. If numbers is not specified, returns the scale's current input domain. 
	*/
	@:override(function():Array<Float>{})
	function domain(range:Array<Float>):Quantize;
	
	/**
	If values is specified, sets the scale's output range to the specified array of values. The array may contain any number of discrete values. The elements in the given array need not be numbers; any value or type will work. If values is not specified, returns the scale's current output range.
	*/
	@:override(function():Array<Dynamic>{})
	function range(range:Array<Dynamic>):Quantize;
	
	/**
	Returns an exact copy of this scale. Changes to this scale will not affect the returned scale, and vice versa. 
	*/
	function copy():Quantize;
}