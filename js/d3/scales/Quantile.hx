package js.d3.scales;

/**
Quantile scales map an input domain to a discrete range. Although the input domain is continuous and the scale will accept any reasonable input value, the input domain is specified as a discrete set of values. The number of values in (the cardinality of) the output range determines the number of quantiles that will be computed from the input domain. To compute the quantiles, the input domain is sorted, and treated as a population of discrete values. The input domain is typically a dimension of the data that you want to visualize, such as the daily change of the stock market. The output range is typically a dimension of the desired output visualization, such as a diverging color scale. 

copy from Quantize
*/
extern class Quantile{


	@:selfCall function selfCall(x:Float):Primitive;
	

	function invertExtent(y:Primitive):Array<Float>;
	

	@:override(function():Array<Float>{})
	function domain(range:Array<Float>):Quantile;
	

	@:override(function():Array<Primitive>{})
	function range(range:Array<Primitive>):Quantile;
	
	function copy():Quantile;
}