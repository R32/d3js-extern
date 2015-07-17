package js.d3;


import js.d3.scales.*;
/**
https://github.com/mbostock/d3/wiki/Scales

zh-CN: .domain 用于确定输入值, .ticks 处理 .domain 的范围值. range 作为输出值
*/
extern class Scale{

	/**
	Constructs a new quantize scale with the default domain [0,1] and the default range [0,1]. Thus, the default quantize scale is equivalent to the round function for numbers; for example quantize(0.49) returns 0, and quantize(0.51) returns 1.

	```js
	var q = d3.scale.quantize().domain([0, 1]).range(['a', 'b', 'c']);
	//q(0.3) === 'a', q(0.4) === 'b', q(0.6) === 'b', q(0.7) ==='c';
	//q.invertExtent('a') returns [0, 0.3333333333333333];
	```
	
	构建一个量化比例尺
	*/
	function quantize():Quantize;
	
	/**
	Constructs a new quantile scale with an empty domain and an empty range. The quantile scale is invalid until both a domain and range are specified. 
	
	构建一个分位数比例尺
	*/
	function quantile():Quantile;
	
	/**
	Constructs a new threshold scale with the default domain [.5] and the default range [0,1]. Thus, the default threshold scale is equivalent to the round function for numbers; for example threshold(0.49) returns 0, and threshold(0.51) returns 1.

	```js
	var t = d3.scale.threshold().domain([0, 1]).range(['a', 'b', 'c']); 
	t(-1) === 'a';
	t(0) === 'b';
	t(0.5) === 'b';
	t(1) === 'c';
	t(1000) === 'c';
	t.invertExtent('a'); //returns [undefined, 0]
	t.invertExtent('b'); //returns [0, 1]
	t.invertExtent('c'); //returns [1, undefined]
	```
	*/
	function threshold():Threshold;
	
	/**
	Constructs a new identity scale with the default domain [0, 1] and the default range [0, 1]. An identity scale is always equivalent to the identity function. 
	
	构建一个线性恒等比例尺。
	*/
	function identity():Identity;
	
	/**
	Constructs a new linear scale with the default domain [0,1] and the default range [0,1]. Thus, the default linear scale is equivalent to the identity function for numbers; for example linear(0.5) returns 0.5. 
	*/
	function linear():Linear;
	
	/**
	Constructs a new power scale with the default domain [0,1], the default range [0,1], and the exponent .5. This method is shorthand for:

	```js
	d3.scale.pow().exponent(.5)
	```

	The returned scale is a function that takes a single argument x representing a value in the input domain; the return value is the corresponding value in the output range. Thus, the returned scale is equivalent to the sqrt function for numbers; for example sqrt(0.25) returns 0.5.	 
	*/
	function sqrt():Pow;
	
	/**
	Constructs a new power scale with the default domain [0,1], the default range [0,1], and the default exponent 1. Thus, the default power scale is equivalent to the identity function for numbers; for example pow(0.5) returns 0.5. 
	*/
	function pow():Pow;
	
	/**
	Constructs a new log scale with the default domain [1,10], the default range [0,1], and the base 10. 
	*/
	function log():Log;
	
	/**
	Constructs a new ordinal scale with an empty domain and an empty range. The ordinal scale is invalid (always returning undefined) until an output range is specified. 
	*/
	function ordinal():Ordinal;
	
	
	/**
	https://github.com/mbostock/d3/wiki/Ordinal-Scales#categorical-colors
	
	Constructs a new ordinal scale with a range of ten categorical colors:
	*/
	function category10():Ordinal;
	
	/**
	Constructs a new ordinal scale with a range of twenty categorical colors: 
	*/
	function category20():Ordinal;
	
	
	/**
	Constructs a new ordinal scale with a range of twenty categorical colors: 
	*/
	function category20b():Ordinal;
	
	/**
	Constructs a new ordinal scale with a range of twenty categorical colors: 
	*/
	function category20c():Ordinal;
	
	
}