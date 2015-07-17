package js.d3.scales;

/**
Quantile scales map an input domain to a discrete range. Although the input domain is continuous and the scale will accept any reasonable input value, the input domain is specified as a discrete set of values. The number of values in (the cardinality of) the output range determines the number of quantiles that will be computed from the input domain. To compute the quantiles, the input domain is sorted, and treated as a population of discrete values. The input domain is typically a dimension of the data that you want to visualize, such as the daily change of the stock market. The output range is typically a dimension of the desired output visualization, such as a diverging color scale. 

copy from Quantize
*/
extern class Quantile{
	
	/**
	Constructs a new quantile scale with an empty domain and an empty range. The quantile scale is invalid until both a domain and range are specified. 
	*/
	@:selfCall function selfCall(x:Float):Dynamic;
	
	/**
	Returns the extent of values in the input domain [x0, x1] for the corresponding value in the output range y, representing the inverse mapping from range to domain. This method is useful for interaction, say to determine the value in the input domain that corresponds to the pixel location under the mouse. 
	*/
	function invertExtent(y:Dynamic):Array<Float>;
	
	/**
	If numbers is specified, sets the input domain of the quantile scale to the specified set of discrete numeric values. The array must not be empty, and must contain at least one numeric value; NaN, null and undefined values are ignored and not considered part of the sample population. If the elements in the given array are not numbers, they will be coerced to numbers; this coercion happens similarly when the scale is called. A copy of the input array is sorted and stored internally. Thus, a quantile scale can be used to encode any type that can be converted to numbers. If numbers is not specified, returns the scale's current input domain. 
	*/
	@:override(function():Array<Float>{})
	function domain(range:Array<Float>):Quantile;
	
		/**
	If values is specified, sets the discrete values in the output range. The array must not be empty, and may contain any type of value. The number of values in (the cardinality, or length, of) the values array determines the number of quantiles that are computed. For example, to compute quartiles, values must be an array of four elements such as [0, 1, 2, 3]. If values is not specified, returns the current output range. 
	*/
	@:override(function():Array<Dynamic>{})
	function range(range:Array<Dynamic>):Quantile;
	
	/**
	Returns the quantile thresholds. If the output range contains n discrete values, the returned threshold array will contain n - 1 values. Values less than the first element in the thresholds array, quantiles()[0], are considered in the first quantile; greater values less than the second threshold are in the second quantile, and so on. Internally, the thresholds array is used with d3.bisect to find the output quantile associated with the given input value. 
	*/
	function quantiles():Array<Float>;
	
	/**
	Returns an exact copy of this scale. Changes to this scale will not affect the returned scale, and vice versa. 
	*/
	function copy():Quantile;
}