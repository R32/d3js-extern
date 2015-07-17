package js.d3.scales;


import js.d3.Transition;
/**
Linear scales are the most common scale, and a good default choice to map a continuous input domain to a continuous output range. The mapping is linear in that the output range value y can be expressed as a linear function of the input domain value x: y = mx + b. The input domain is typically a dimension of the data that you want to visualize, such as the height of students (measured in meters) in a sample population. The output range is typically a dimension of the desired output visualization, such as the height of bars (measured in pixels) in a histogram.
*/
extern class Linear{
	
	/**
	Given a value x in the input domain, returns the corresponding value in the output range.

	Note: some interpolators reuse return values. For example, if the domain values are arbitrary objects, then d3.interpolateObject is automatically applied and the scale reuses the returned object. Often, the return value of a scale is immediately used to set an attribute or style, and you don’t have to worry about this; however, if you need to store the scale’s return value, use string coercion or create a copy as appropriate. 
	*/
	@:selfCall function selfCall(x:Float):Dynamic;
	
	/**
	Returns the value in the input domain x for the corresponding value in the output range y. This represents the inverse mapping from range to domain. For a valid value y in the output range, linear(linear.invert(y)) equals y; similarly, for a valid value x in the input domain, linear.invert(linear(x)) equals x. Equivalently, you can construct the invert operator by building a new scale while swapping the domain and range. The invert operator is particularly useful for interaction, say to determine the value in the input domain that corresponds to the pixel location under the mouse.

	Note: the invert operator is only supported if the output range is numeric! D3 allows the output range to be any type; under the hood, d3.interpolate or a custom interpolator of your choice is used to map the normalized parameter t to a value in the output range. Thus, the output range may be colors, strings, or even arbitrary objects. As there is no facility to "uninterpolate" arbitrary types, the invert operator is currently supported only on numeric ranges. 
	
	zh-CN: 需要 Number 类型的 range.
	*/
	function invert(y:Float):Float;
	
	/**
	If numbers is specified, sets the scale's input domain to the specified array of numbers. The array must contain two or more numbers. If the elements in the given array are not numbers, they will be coerced to numbers; this coercion happens similarly when the scale is called. Thus, a linear scale can be used to encode types such as date objects that can be converted to numbers; however, it is often more convenient to use d3.time.scale for dates. (You can implement your own convertible number objects using valueOf.) If numbers is not specified, returns the scale's current input domain.

	Although linear scales typically have just two numeric values in their domain, you can specify more than two values for a polylinear scale. In this case, there must be an equivalent number of values in the output range. A polylinear scale represents multiple piecewise linear scales that divide a continuous domain and range. This is particularly useful for defining diverging quantitative scales. For example, to interpolate between white and red for negative values, and white and green for positive values, say:

	```js
	var color = d3.scale.linear()
		.domain([-1, 0, 1])
		.range(["red", "white", "green"]);
	```
	
	The resulting value of color(-.5) is rgb(255, 128, 128), and the value of color(.5) is rgb(128, 192, 128). Internally, polylinear scales perform a binary search for the output interpolator corresponding to the given domain value. By repeating values in both the domain and range, you can also force a chunk of the input domain to map to a constant in the output range. 
	*/
	@:override(function():Array<Float> { } )	
	function domain(range:Array<Float>):Linear;
	
	/**
	If values is specified, sets the scale's output range to the specified array of values. The array must contain two or more values, to match the cardinality of the input domain, otherwise the longer of the two is truncated to match the other. The elements in the given array need not be numbers; any value that is supported by the underlying interpolator will work. However, numeric ranges are required for the invert operator. If values is not specified, returns the scale's current output range. 
	
	zh-cn: 虽然支持任意类型,但是 .invert 只支持 Number 类型.
	*/
	@:override(function():Array<Dynamic> { } )
	function range(range:Array<Dynamic>):Linear;
	
	/**
	Sets the scale's output range to the specified array of values, while also setting the scale's interpolator to d3.interpolateRound. This is a convenience routine for when the values output by the scale should be exact integers, such as to avoid antialiasing artifacts. It is also possible to round the output values manually after the scale is applied. 
	
	zh-CN: 将默认的 d3.interpolate 设置为 d3.interpolateRound, 这将会使 selfCall 的返回值变为 Int 类型, 并且用 range 将不能恢复为其它如 "#000000" 或 "0.1" 这些类型,除非更改 interpolate 的类型.
	*/
	function rangeRound(range:Array<Int>):Linear;
	
	/**
	If factory is specified, sets the scale's output interpolator using the specified factory. The interpolator factory defaults to d3.interpolate, and is used to map the normalized domain parameter t in [0,1] to the corresponding value in the output range. The interpolator factory will be used to construct interpolators for each adjacent pair of values from the output range. If factory is not specified, returns the scale's interpolator factory.
	*/
	@:overload(function():Interpolator<Dynamic>{})
	function interpolate(factory:Interpolator<Dynamic>):Linear;
	
	/**
	If boolean is specified, enables or disables clamping accordingly. By default, clamping is disabled, such that if a value outside the input domain is passed to the scale, the scale may return a value outside the output range through linear extrapolation. For example, with the default domain and range of [0,1], an input value of 2 will return an output value of 2. If clamping is enabled, the normalized domain parameter t is clamped to the range [0,1], such that the return value of the scale is always within the scale's output range. If boolean is not specified, returns whether or not the scale currently clamps values to within the output range. 
	*/
	@:overload(function():Bool { } )	
	function clamp(b:Bool):Linear;
	
	/**
	*Extends the domain so that it starts and ends on nice round values. This method typically modifies the scale's domain, and may only extend the bounds to the nearest round value. The precision of the round value is dependent on the extent of the domain dx according to the following formula: exp(round(log(dx)) - 1). Nicing is useful if the domain is computed from data and may be irregular. For example, for a domain of [0.20147987687960267, 0.996679553296417], the nice domain is [0.2, 1]. If the domain has more than two values, nicing the domain only affects the first and last value.

	The optional tick count argument allows greater control over the step size used to extend the bounds, guaranteeing that the returned ticks will exactly cover the domain. 
	
	zh-CN: 优化 .domain 的区域定义, 参数 count 能更好地帮助优化.
	*/
	function nice(?count:Int):Linear;
	
	/**
	Returns approximately count representative values from the scale's input domain. If count is not specified, it defaults to 10. The returned tick values are uniformly spaced, have human-readable values (such as multiples of powers of 10), and are guaranteed to be within the extent of the input domain. Ticks are often used to display reference lines, or tick marks, in conjunction with the visualized data. The specified count is only a hint; the scale may return more or fewer values depending on the input domain. 
	*/
	function ticks(count:Int = 10):Array<Float>;
	
	/**
	Returns a number format function suitable for displaying a tick value. The specified count should have the same value as the count that is used to generate the tick values. You don't have to use the scale's built-in tick format, but it automatically computes the appropriate precision based on the fixed interval between tick values.

	The optional format argument allows a format specifier to be specified, where the precision of the format is automatically substituted by the scale to be appropriate for the tick interval. For example, to format percentage change, you might say:

	```js
	var x = d3.scale.linear().domain([-1, 1]);
	console.log(x.ticks(5).map(x.tickFormat(5, "+%"))); // ["-100%", "-50%", "+0%", "+50%", "+100%"]
	```

	Likewise, if format uses the format type s, the scale will compute a SI-prefix based on the largest value in the domain, and use that SI-prefix for all tick values. If the format already specifies a precision, this method is equivalent to d3.format.

	Note that when using a log scale in conjunction with an axis, you typically want to use axis.ticks rather than axis.tickFormat to take advantage of the log scale’s custom tick format, as in [bl.ocks.org/5537697](http://bl.ocks.org/mbostock/5537697). 
	*/
	function tickFormat(count:Int, ?format:String):Float->String;
	
	/**
	Returns an exact copy of this linear scale. Changes to this scale will not affect the returned scale, and vice versa. 
	*/
	function copy():Linear;
}