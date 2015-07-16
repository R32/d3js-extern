package js.d3.scales;

import js.d3.Transition;

/**
Log scales are similar to linear scales, except there's a logarithmic transform that is applied to the input domain value before the output range value is computed. The mapping to the output range value y can be expressed as a function of the input domain value x: y = m log(x) + b.

As log(0) is negative infinity, a log scale must have either an exclusively-positive or exclusively-negative domain; the domain must not include or cross zero. A log scale with a positive domain has a well-defined behavior for positive values, and a log scale with a negative domain has a well-defined behavior for negative values (the input value is multiplied by -1, and the resulting output value is also multiplied by -1). The behavior of the scale is undefined if you pass a negative value to a log scale with a positive domain or vice versa.
*/
extern class Log{
	
	/**
	Given a value x in the input domain, returns the corresponding value in the output range.

	Note: some interpolators reuse return values. For example, if the domain values are arbitrary objects, then d3.interpolateObject is automatically applied and the scale reuses the returned object. Often, the return value of a scale is immediately used to set an attribute or style, and you don’t have to worry about this; however, if you need to store the scale’s return value, use string coercion or create a copy as appropriate.
	*/
	@:selfCall function selfCall(x:Float):Dynamic;
	
	/**
	Returns the value in the input domain x for the corresponding value in the output range y. This represents the inverse mapping from range to domain. For a valid value y in the output range, log(log.invert(y)) equals y; similarly, for a valid value x in the input domain, log.invert(log(x)) equals x. Equivalently, you can construct the invert operator by building a new scale while swapping the domain and range. The invert operator is particularly useful for interaction, say to determine the value in the input domain that corresponds to the pixel location under the mouse.

	Note: the invert operator is only supported if the output range is numeric! D3 allows the output range to be any type; under the hood, d3.interpolate or a custom interpolator of your choice is used to map the normalized parameter t to a value in the output range. Thus, the output range may be colors, strings, or even arbitrary objects. As there is no facility to "uninterpolate" arbitrary types, the invert operator is currently supported only on numeric ranges. 
	*/
	function invert(y:Float):Float;
	
	/**
	If numbers is specified, sets the scale's input domain to the specified array of numbers. The array must contain two or more numbers. If the elements in the given array are not numbers, they will be coerced to numbers; this coercion happens similarly when the scale is called. Thus, a log scale can be used to encode any type that can be converted to numbers. If numbers is not specified, returns the scale's current input domain.

	As with linear scales (see linear.domain), log scales can also accept more than two values for the domain and range, thus resulting in polylog scale. 
	*/
	@:override(function():Array<Float> { } )	
	function domain(range:Array<Float>):Log;
	
	/**
	If values is specified, sets the scale's output range to the specified array of values. The array must contain two or more values, to match the cardinality of the input domain, otherwise the longer of the two is truncated to match the other. The elements in the given array need not be numbers; any value that is supported by the underlying interpolator will work. However, numeric ranges are required for the invert operator. If values is not specified, returns the scale's current output range. 
	*/
	@:override(function():Array<Dynamic> { } )
	function range(range:Array<Dynamic>):Log;
	
	
	/**
	Sets the scale's output range to the specified array of values, while also setting the scale's interpolator to d3.interpolateRound. This is a convenience routine for when the values output by the scale should be exact integers, such as to avoid antialiasing artifacts. It is also possible to round the output values manually after the scale is applied. 
	*/
	function rangeRound(range:Array<Int>):Log;
	
	/**
	If base is specified, sets the base for this logarithmic scale. If base is not specified, returns the current base, which defaults to 10. 
	*/
	@:overload(function():Float{})
	function base(base:Float):Log;
	
	/**
	If factory is specified, sets the scale's output interpolator using the specified factory. The interpolator factory defaults to d3.interpolate, and is used to map the normalized domain parameter t in [0,1] to the corresponding value in the output range. The interpolator factory will be used to construct interpolators for each adjacent pair of values from the output range. If factory is not specified, returns the scale's interpolator factory. 
	*/
	@:overload(function():Interpolator<Dynamic>{})
	function interpolate(factory:Interpolator<Dynamic>):Log;
	
	/**
	If boolean is specified, enables or disables clamping accordingly. By default, clamping is disabled, such that if a value outside the input domain is passed to the scale, the scale may return a value outside the output range through linear extrapolation. For example, with the default domain and range of [0,1], an input value of 2 will return an output value of 2. If clamping is enabled, the normalized domain parameter t is clamped to the range [0,1], such that the return value of the scale is always within the scale's output range. If boolean is not specified, returns whether or not the scale currently clamps values to within the output range.
	*/
	@:overload(function():Bool { } )	
	function clamp(b:Bool):Log;
	
	/**
	Extends the domain so that it starts and ends on nice round values. This method typically modifies the scale's domain, and may only extend the bounds to the nearest round value. The nearest round value is based on integer powers of the scale’s base, which defaults to 10. Nicing is useful if the domain is computed from data and may be irregular. For example, for a domain of [0.20147987687960267, 0.996679553296417], the nice domain is [0.1, 1]. If the domain has more than two values, nicing the domain only affects the first and last value. 
	*/
	function nice():Log;
	
	/**
	Returns representative values from the scale's input domain. The returned tick values are uniformly spaced within each power of ten, and are guaranteed to be within the extent of the input domain. Ticks are often used to display reference lines, or tick marks, in conjunction with the visualized data. Note that the number of ticks cannot be customized (due to the nature of log scales); however, you can filter the returned array of values if you want to reduce the number of ticks. 
	*/
	function ticks():Array<Float>;
	
	/**
	Returns a number format function suitable for displaying a tick value. The returned tick format is implemented as d.toPrecision(1). If a count is specified, then some of the tick labels may not be displayed; this is useful if there is not enough room to fit all of the tick labels. However, note that the tick marks will still be displayed (so that the log scale distortion remains visible). When specifying a count, you may also override the format function; you can also specify a format specifier as a string, and it will automatically be wrapped with d3.format. For example, to get a tick formatter that will display 20 ticks of a currency:

	```js
	scale.tickFormat(20, "$,.2f");
	```
	
	If the format specifier doesn’t have a defined precision, the precision will be set automatically by the scale, returning the appropriate format. This provides a convenient, declarative way of specifying a format whose precision will be automatically set by the scale. 
	*/
	function tickFormat(count:Int, ?format:String):Float->String;
	
	/**
	Returns an exact copy of this scale. Changes to this scale will not affect the returned scale, and vice versa. 
	*/
	function copy():Log;
}