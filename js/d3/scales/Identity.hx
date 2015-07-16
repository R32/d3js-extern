package js.d3.scales;

/**
Identity scales are a special case of linear scales where the domain and range are identical; the scale and its invert method are both the identity function. These scales are occasionally useful when working with pixel coordinates, say in conjunction with the axis and brush components.
*/
extern class Identity {
	
	/**
	equivalent to .invert()
	*/
	@:selfCall function selfCall(x:Float):Float;
	
	/**
	Returns the given value x.
	*/
	function invert(x:Float):Float;
	
	/**
	equivalent to .range
	
	zh-CN: range 和 domain 为相同一个函数, 就象其中一个为另一个的别名
	*/
	@:override(function():Array<Float> { } )	
	function domain(range:Array<Float>):Identity;
	
	/**
	If numbers is specified, sets the scale's input domain and output range to the specified array of numbers. The array must contain two or more numbers. If the elements in the given array are not numbers, they will be coerced to numbers; this coercion happens similarly when the scale is called. If numbers is not specified, returns the scale's current input domain (or equivalently, output range). 
	*/
	@:override(function():Array<Float> { } )	
	function range(range:Array<Float>):Identity;
	
	/**
	Returns approximately count representative values from the scale's input domain (or equivalently, output range). If count is not specified, it defaults to 10. The returned tick values are uniformly spaced, have human-readable values (such as multiples of powers of 10), and are guaranteed to be within the extent of the input domain. Ticks are often used to display reference lines, or tick marks, in conjunction with the visualized data. The specified count is only a hint; the scale may return more or fewer values depending on the input domain. 
	*/
	function ticks(count:Int = 10):Array<Float>;
	
	/**
	Returns a number format function suitable for displaying a tick value. The specified count should have the same value as the count that is used to generate the tick values. You don't have to use the scale's built-in tick format, but it automatically computes the appropriate precision based on the fixed interval between tick values.

	The optional format argument allows a format specifier to be specified. If the format specifier doesn’t have a defined precision, the precision will be set automatically by the scale, returning the appropriate format. This provides a convenient, declarative way of specifying a format whose precision will be automatically set by the scale.
	
	see Linear::tickFormat
	*/
	function tickFormat(count:Int, ?format:String):Float->String;
	
	function copy():Identity;
}