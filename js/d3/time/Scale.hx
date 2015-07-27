package js.d3.time;

import js.d3.Transition;
import js.d3.time.Interval;
/**
D3's time scale is an extension of d3.scale.linear that uses JavaScript Date objects as the domain representation. Thus, unlike the normal linear scale, domain values are coerced to dates rather than numbers; similarly, the invert function returns a date. Most conveniently, the time scale also provides suitable ticks based on time intervals, taking the pain out of generating axes for nearly any time-based domain.

A scale object, such as that returned by d3.time.scale, is both an object and a function. That is: you can call the scale like any other function, and the scale has additional methods that change its behavior. Like other classes in D3, scales follow the method chaining pattern where setter methods return the scale itself, allowing multiple setters to be invoked in a concise statement.
*/
@:native("d3.time.scale") extern class Scale {
	
	/**
	Given a date x in the input domain, returns the corresponding value in the output range. 
	*/
	@:selfCall var selfCall(default, null):Date->Dynamic;
	
	/**
	Returns the date in the input domain x for the corresponding value in the output range y. This represents the inverse mapping from range to domain. For a valid value y in the output range, scale(scale.invert(y)) equals y; similarly, for a valid date x in the input domain, scale.invert(scale(x)) equals x. The invert operator is particularly useful for interaction, say to determine the date in the input domain that corresponds to the pixel location under the mouse. 
	
	zh-CN: 需要 Number 类型的 range.
	*/
	function invert(y:Float):Date;
	
	/**
	If dates is specified, sets the scale's input domain to the specified array of dates. The array must contain two or more dates. If the elements in the given array are not dates, they will be coerced to dates; this coercion happens similarly when the scale is called. If dates is not specified, returns the scale's current input domain. Although time scales typically have just two dates in their domain, you can specify more than two dates for a polylinear scale. In this case, there must be an equivalent number of values in the output range. 
	*/
	@:override(function():Array<Date> { } )	
	function domain(range:Array<Date>):Scale;
	
	/**
	Extends the domain so that it starts and ends on nice round values as determined by the specified time interval and optional step count. As an alternative to specifying an explicit time interval, a numeric count can be specified, and a time interval will be chosen automatically to be consistent with scale.ticks. If count is not specified, it defaults to 10.

	This method typically extends the scale's domain, and may only extend the bounds to the nearest round value. Nicing is useful if the domain is computed from data and may be irregular. For example, for a domain of [2009-07-13T00:02, 2009-07-13T23:48], the nice domain is [2009-07-13, 2009-07-14]. If the domain has more than two values, nicing the domain only affects the first and last value.
	
	zh-CN: 如果 domain 有超过二个值, 那么仅处理第一个与最后一个元素. Interval 继承自 IntervalUtc, 使用 D3.time.day 或 D3.time.second 之类的字段
	*/
	@:overload(function(interval:IntervalUtc, ?step:Float = 1):Scale { } )
	function nice(count:Int = 10):Scale;
	
	/**
	If boolean is specified, enables or disables clamping accordingly. By default, clamping is disabled, such that if a value outside the input domain is passed to the scale, the scale may return a value outside the output range through linear extrapolation. For example, with the default domain and range of [0,1], an input value of 2 will return an output value of 2. If clamping is enabled, the normalized domain parameter t is clamped to the range [0,1], such that the return value of the scale is always within the scale's output range. If boolean is not specified, returns whether or not the scale currently clamps values to within the output range. 
	*/
	@:overload(function():Bool { } )	
	function clamp(b:Bool):Scale;
	
	/**
	If values is specified, sets the scale's output range to the specified array of values. The array must contain two or more values, to match the cardinality of the input domain. The elements in the given array need not be numbers; any value that is supported by the underlying interpolator will work. However, numeric ranges are required for the invert operator. If values is not specified, returns the scale's current output range. 
	
	zh-cn: 虽然支持任意类型,但是 .invert 只支持 Number 类型.
	*/
	@:override(function():Array<Dynamic> { } )
	function range(range:Array<Dynamic>):Scale;
	
	/**
	Sets the scale's output range to the specified array of values, while also setting the scale's interpolator to d3.interpolateRound. This is a convenience routine for when the values output by the scale should be exact integers, such as to avoid antialiasing artifacts. It is also possible to round the output values manually after the scale is applied. 
	
	zh-cn: 同时设置 interpolator 为 d3.interpolateRound.
	*/
	function rangeRound(range:Array<Int>):Scale;
	
	/**
	If factory is specified, sets the scale's output interpolator using the specified factory. The interpolator factory defaults to d3.interpolate, and is used to map the normalized domain parameter t in [0,1] to the corresponding value in the output range. The interpolator factory will be used to construct interpolators for each adjacent pair of values from the output range. If factory is not specified, returns the scale's interpolator factory.
	*/
	@:overload(function():Interpolator<Dynamic>{})
	function interpolate(factory:Interpolator<Dynamic>):Scale;
	
	/**
	Returns representative dates from the scale's input domain. The returned tick dates are uniformly spaced (modulo irregular time intervals, such as months and leap years), have human-readable values (such as midnights), and are guaranteed to be within the extent of the input domain. Ticks are often used to display reference lines, or tick marks, in conjunction with the visualized data.

	If count is a number, then approximately count ticks will be returned. If count is not specified, it defaults to 10. The specified count is only a hint; the scale may return more or fewer values depending on the input domain. If a time interval is specified, then the time interval’s range function will be used to generate ticks, being passed the optional step argument, if any. For example, to create ten default ticks, say:

	```js
	scale.ticks(10);
	```
	
	While to create ticks at 15-minute intervals, say:

	```js
	scale.ticks(d3.time.minute, 15);
	```
	
	Note: for UTC scales, be sure to use the appropriate UTC range method (such as d3.time.minute.utc).

	The following time intervals are considered for automatic ticks:

	 - 1-, 5-, 15- and 30-second.
	 
	 - 1-, 5-, 15- and 30-minute.
	
	 - 1-, 3-, 6- and 12-hour.
	
	 - 1- and 2-day.
	
	 - 1-week.
	
	 - 1- and 3-month.
	
	 - 1-year.

	This set of time intervals is somewhat arbitrary and additional values may be added in the future.
	
	NOTE: in haxe, use D3.time.day or D3.time.minute... `class Interval inherit from IntervalUtc`
	*/
	@:overload(function(interval:IntervalUtc, ?step:Float = 1):Array<Date> { } )
	function ticks(count:Int = 10):Array<Date>;
	
	/**
	Returns a time format function suitable for displaying a tick value. The specified count should have the same value as the count that is used to generate the tick values. You don't have to use the scale's built-in tick format, but it automatically computes the appropriate display based on the input date.

	The following time formats are considered:


	 - %Y - for year boundaries, such as "2011".

	 - %B - for month boundaries, such as "February".

	 - %b %d - for week boundaries, such as "Feb 06".

	 - %a %d - for day boundaries, such as "Mon 07".

	 - %I %p - for hour boundaries, such as "01 AM".

	 - %I:%M - for minute boundaries, such as "01:23".

	 - :%S - for second boundaries, such as ":45".

	 - .%L - milliseconds for all other times, such as ".012".

	By using multi-scale time formats, the default tick format provides both local and global context for each time interval. For example, by showing the sequence [11 PM, Mon 07, 01 AM], the tick formatter reveals information about hours, dates, and day simultaneously—rather than just the hours. If you'd prefer single-scale time formatting, you can always use your own d3.time.format. You can also roll your own custom multi-scale time format. 
	*/
	function tickFormat():Date->String;
	
	/**
	Returns an exact copy of this time scale. Changes to this scale will not affect the returned scale, and vice versa. 
	*/
	function copy():Scale;
	
	/**
	Constructs a new time scale with the default domain and range; the ticks and tick format are configured for UTC time. 
	*/
	static function utc():Scale;
}