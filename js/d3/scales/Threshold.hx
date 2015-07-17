package js.d3.scales;



/**
Threshold scales are similar to quantize scales, except they allow you to map arbitrary subsets of the domain to discrete values in the range. The input domain is still continuous, and divided into slices based on a set of threshold values. The input domain is typically a dimension of the data that you want to visualize, such as the height of students (measured in meters) in a sample population. The output range is typically a dimension of the desired output visualization, such as a set of colors (represented as strings). 
*/
extern class Threshold{
	
	/**
	Given a value x in the input domain, returns the corresponding value in the output range. 
	*/
	@:selfCall function selfCall(x:Primitive):Dynamic;
	
	/**
	Returns the extent of values in the input domain [x0, x1] for the corresponding value in the output range y, representing the inverse mapping from range to domain. This method is useful for interaction, say to determine the value in the input domain that corresponds to the pixel location under the mouse. 
	*/
	function invertExtent(y:Dynamic):Array<Primitive>;
	
	/**
	If domain is specified, sets the scale's input domain to the specified array of values. The values must be in sorted ascending order, or the behavior of the scale is undefined. The values are typically numbers, but any naturally ordered values (such as strings) will work. Thus, a threshold scale can be used to encode any type that is ordered. If the number of values in the scale's range is N + 1, the number of values in the scale's domain must be N. If there are fewer than N elements in the domain, the additional values in the range are ignored. If there are more than N elements in the domain, the scale may return undefined for some inputs. If domain is not specified, returns the scale's current input domain. 
	*/
	@:override(function():Array<Primitive>{})
	function domain(range:Array<Primitive>):Threshold;
	
	/**
	If values is specified, sets the scale's output range to the specified array of values. If the number of values in the scale's domain is N, the number of values in the scale's range must be N + 1. If there are fewer than N+1 elements in the range, the scale may return undefined for some inputs. If there are more than N + 1 elements in the range, the additional values are ignored. The elements in the given array need not be numbers; any value or type will work. If values is not specified, returns the scale's current output range. 
	*/
	@:override(function():Array<Dynamic>{})
	function range(range:Array<Dynamic>):Threshold;
	
	/**
	Returns an exact copy of this scale. Changes to this scale will not affect the returned scale, and vice versa. 
	*/
	function copy():Threshold;
}