package js.d3.scales;

import js.d3.Transition;
/**
Power scales are similar to linear scales, except there's an exponential transform that is applied to the input domain value before the output range value is computed. The mapping to the output range value y can be expressed as a function of the input domain value x: y = mx^k + b, where k is the exponent value. Power scales also support negative values, in which case the input value is multiplied by -1, and the resulting output value is also multiplied by -1.
*/
extern class Pow{
	
	/**
	Given a value x in the input domain, returns the corresponding value in the output range.

	Note: some interpolators **reuse return values**. For example, if the domain values are arbitrary objects, then d3.interpolateObject is automatically applied and the scale reuses the returned object. Often, the return value of a scale is immediately used to set an attribute or style, and you don’t have to worry about this; however, if you need to store the scale’s return value, use string coercion or create a copy as appropriate. 
	*/
	@:selfCall function selfCall(x:Float):Dynamic;
	
	/**
	Returns the value in the input domain x for the corresponding value in the output range y. This represents the inverse mapping from range to domain. For a valid value y in the output range, pow(pow.invert(y)) equals y; similarly, for a valid value x in the input domain, pow.invert(pow(x)) equals x. Equivalently, you can construct the invert operator by building a new scale while swapping the domain and range. The invert operator is particularly useful for interaction, say to determine the value in the input domain that corresponds to the pixel location under the mouse.

	Note: the invert operator is only supported if the output range is numeric! D3 allows the output range to be any type; under the hood, d3.interpolate or a custom interpolator of your choice is used to map the normalized parameter t to a value in the output range. Thus, the output range may be colors, strings, or even arbitrary objects. As there is no facility to "uninterpolate" arbitrary types, the invert operator is currently supported only on numeric ranges. 
	
	zh-CN: pow 建立在 linear 上,因此同样仅支持数字形式的 range
	*/
	function invert(y:Float):Float;
	
	/**
	If numbers is specified, sets the scale's input domain to the specified array of numbers. The array must contain two or more numbers. If the elements in the given array are not numbers, they will be coerced to numbers; this coercion happens similarly when the scale is called. Thus, a power scale can be used to encode any type that can be converted to numbers. If numbers is not specified, returns the scale's current input domain.

	As with linear scales (see linear.domain), power scales can also accept more than two values for the domain and range, thus resulting in polypower scale. 
	*/
	@:override(function():Array<Float> { } )	
	function domain(range:Array<Float>):Pow;
	
	/**
	If values is specified, sets the scale's output range to the specified array of values. The array must contain two or more values, to match the cardinality of the input domain, otherwise the longer of the two is truncated to match the other. The elements in the given array need not be numbers; any value that is supported by the underlying interpolator will work. However, numeric ranges are required for the invert operator. If values is not specified, returns the scale's current output range.
	*/
	@:override(function():Array<Dynamic> { } )
	function range(range:Array<Dynamic>):Pow;
	
	/**
	Sets the scale's output range to the specified array of values, while also setting the scale's interpolator to d3.interpolateRound. This is a convenience routine for when the values output by the scale should be exact integers, such as to avoid antialiasing artifacts. It is also possible to round the output values manually after the scale is applied.
	
	zh-CN: 将默认的 d3.interpolate 设置为 d3.interpolateRound, 这将会使 selfCall 的返回值变为 Int 类型, 并且用 range 将不能恢复为其它如 "#000000" 或 "0.1" 这些类型,除非更改 interpolate 的类型.
	*/
	function rangeRound(range:Array<Int>):Pow;
	
	/**
	If k is specified, sets the current exponent to the given numeric value. If k is not specified, returns the current exponent. The default value is 1. 
	*/
	@:overload(function():Float{})
	function exponent(k:Float):Pow;
	
	/**
	If factory is specified, sets the scale's output interpolator using the specified factory. The interpolator factory defaults to d3.interpolate, and is used to map the normalized domain parameter t in [0,1] to the corresponding value in the output range. The interpolator factory will be used to construct interpolators for each adjacent pair of values from the output range. If factory is not specified, returns the scale's interpolator factory.
	*/
	@:overload(function():Interpolator<Dynamic>{})
	function interpolate(factory:Interpolator<Dynamic>):Pow;
	
	/**
	If boolean is specified, enables or disables clamping accordingly. By default, clamping is disabled, such that if a value outside the input domain is passed to the scale, the scale may return a value outside the output range through linear extrapolation. For example, with the default domain and range of [0,1], an input value of 2 will return an output value of 2. If clamping is enabled, the normalized domain parameter t is clamped to the range [0,1], such that the return value of the scale is always within the scale's output range. If boolean is not specified, returns whether or not the scale currently clamps values to within the output range.
	*/
	@:overload(function():Bool { } )	
	function clamp(b:Bool):Pow;
	
	
	/**
	Extends the domain so that it starts and ends on nice round values. This method typically modifies the scale's domain, and may only extend the bounds to the nearest round value. The precision of the round value is dependent on the extent of the domain dx according to the following formula: exp(round(log(dx)) - 1). Nicing is useful if the domain is computed from data and may be irregular. For example, for a domain of [0.20147987687960267, 0.996679553296417], the nice domain is [0.2, 1]. If the domain has more than two values, nicing the domain only affects the first and last value.

	The optional m argument allows a tick count to be specified to control the step size used prior to extending the bounds.
	
	zh-CN: 优化 .domain 的区域定义, 参数 m 能更好地帮助优化.
	*/
	function nice(?m:Int):Pow;
	
	/**
	Returns approximately count representative values from the scale's input domain. If count is not specified, it defaults to 10. The returned tick values are uniformly spaced, have human-readable values (such as multiples of powers of 10), and are guaranteed to be within the extent of the input domain. Ticks are often used to display reference lines, or tick marks, in conjunction with the visualized data. The specified count is only a hint; the scale may return more or fewer values depending on the input domain. 
	*/
	function ticks(count:Int = 10):Array<Float>;
	
	
	/**
	Returns a number format function suitable for displaying a tick value. The specified count should have the same value as the count that is used to generate the tick values. You don't have to use the scale's built-in tick format, but it automatically computes the appropriate precision based on the fixed interval between tick values.

	The optional format argument allows a format specifier to be specified. If the format specifier doesn’t have a defined precision, the precision will be set automatically by the scale, returning the appropriate format. This provides a convenient, declarative way of specifying a format whose precision will be automatically set by the scale. 
	*/
	function tickFormat(count:Int, ?format:String):Float->String;
	
	
	/**
	Returns an exact copy of this scale. Changes to this scale will not affect the returned scale, and vice versa.
	*/
	function copy():Pow;
}