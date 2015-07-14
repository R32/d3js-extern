package js.d3.math;

/**
https://github.com/mbostock/d3/wiki/Math

You can use the built-in Math.random to generate uniform distributions. For example, to generate a random integer between 0 and 99 (inclusive), you can say `Math.floor(Math.random() * 100)`.
*/
extern class Random{

	/**
	Returns a function for generating random numbers with a [normal (Gaussian) distribution](http://en.wikipedia.org/wiki/Normal_distribution). The expected value of the generated pseudorandom numbers is mean, with the given standard deviation. If deviation is not specified, it defaults to 1.0; if mean is not specified, it defaults to 0.0. 
	
	zh-CN: [正态分布](http://baike.baidu.com/view/45379.htm), 一个服从正态分布的变量只要知道其均数与标准差就可根据公式即可估计任意取值范围内频数比例
	*/
	function normal(?mean:Float = 0.0, deviation:Float = 1.0):Void->Float;
	
	/**
	Returns a function for generating random numbers with a [log-normal distribution](http://en.wikipedia.org/wiki/Log-normal_distribution). The expected value of the random variable’s natural logrithm is mean, with the given standard deviation. If deviation is not specified, it defaults to 1.0; if mean is not specified, it defaults to 0.0. 
	
	zh-CN: [对数正态分布](http://baike.baidu.com/view/2098973.htm), 
	*/
	function logNormal(?mean:Float = 0.0, deviation:Float = 1.0):Void->Float;
	
	/**
	Returns a function for generating random numbers with a [Bates distribution](http://en.wikipedia.org/wiki/Bates_distribution). The number of independent variables is specified by count. 
	*/
	function bates(count:Int):Void->Float;
	
	/**
	Returns a function for generating random numbers with an [Irwin–Hall distribution](http://en.wikipedia.org/wiki/Irwin%E2%80%93Hall_distribution). The number of independent variables is specified by count. 
	*/
	function irwinHall(count:Int):Void->Float;
}