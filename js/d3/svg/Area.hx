package js.d3.svg;

import haxe.extern.EitherType;
import haxe.Constraints.Function;
import js.d3.Transition;

/**
https://github.com/mbostock/d3/wiki/SVG-Shapes#area
*/
@:native("d3.svg.area") extern class Area{
	
	/**
	Returns the path data string for the specified array of data elements, or null if the path is empty. 
	*/
	@:selfCall var selfCall:Array<Dynamic>->String;
	
	/**
	If x is specified, sets the x-accessor to the specified function or constant. If x is not specified, returns the current x-accessor. This accessor is invoked for each element in the data array passed to the area generator. The default accessor assumes that each input element is a two-element array of numbers:

	```js
	function x(d) {
		return d[0];
	}
	```

	Typically, an x-accessor is specified because the input data is in a different format, or because you want to apply a scale. For example, if your data is specified as an object with x and y attributes, rather than a tuple, you might dereference these attributes and apply the scales simultaneously:


	```js
	var x = d3.scale.linear().range([0, w]),
	y = d3.scale.linear().range([h, 0]);

	var area = d3.svg.area()
		.x(function(d) { return x(d.x); })
		.y0(h)
		.y1(function(d) { return y(d.y); });
	```

	The x-accessor is invoked in the same manner as other value functions in D3. The this context of the function is the current element in the selection. (Technically, the same this context that invokes the area function; however, in the common case that the area generator is passed to the attr operator, the this context will be the associated DOM element.) The function is passed two arguments, the current datum (d) and the current index (i). In this context, the index is the index into the array of control points, rather than the index of the current element in the selection. The x-accessor is invoked exactly once per datum, in the order specified by the data array. Thus, it is possible to specify a non-deterministic accessor, such as a random number generator. It is also possible to specify the x-accessor as a constant rather than a function, in which case all points will have the same x-coordinate. 
	*/
	@:overload(function():Float { } )
	@:overload(function(x:Float):Area { } )
	@:overload(function():Dynamic->Float { } )
	function x(func:Dynamic->Float):Area;
	
	@:overload(function():Float { } )
	@:overload(function(x:Float):Area { } )
	@:overload(function():Dynamic->Float { } )
	function x0(func:Dynamic->Float):Area;
	
	@:overload(function():Float { } )
	@:overload(function(x:Float):Area { } )
	@:overload(function():Dynamic->Float { } )
	function x1(func:Dynamic->Float):Area;
	
	
	@:overload(function():Float { } )
	@:overload(function(x:Float):Area { } )
	@:overload(function():Dynamic->Float { } )
	function y(func:Dynamic->Float):Area;
	
	@:overload(function():Float { } )
	@:overload(function(x:Float):Area { } )
	@:overload(function():Dynamic->Float { } )
	function y0(func:Dynamic->Float):Area;
	
	@:overload(function():Float { } )
	@:overload(function(x:Float):Area { } )
	@:overload(function():Dynamic->Float { } )
	function y1(func:Dynamic->Float):Area;
	
	
	/**
	If interpolate is specified, sets the interpolation mode to the specified string or function. If interpolate is not specified, returns the current interpolation mode. The following named modes are supported:

	 - linear - piecewise linear segments, as in a polyline.

	 - step - alternate between horizontal and vertical segments, as in a step function.

	 - step-before - alternate between vertical and horizontal segments, as in a step function.

	 - step-after - alternate between horizontal and vertical segments, as in a step function.

	 - basis - a B-spline, with control point duplication on the ends.

	 - basis-open - an open B-spline; may not intersect the start or end.

	 - cardinal - a Cardinal spline, with control point duplication on the ends.

	 - cardinal-open - an open Cardinal spline; may not intersect the start or end, but will intersect other control points.

	 - monotone - cubic interpolation that preserves monotonicity in y. 
	 
	The behavior of some of these interpolation modes may be further customized by specifying a tension. Technically, the basis-closed and cardinal-closed interpolation modes are also supported, but these make more sense in the context of a line rather than an area.
	*/
	@:overload(function():Array<Array<Float>>->String { } )
	@:overload(function(func:Array<Array<Float>>->String):Area { } )
	@:overload(function():String{ } )
	function interpolate(interpolate:String):Area;
	
	/**
	If tension is specified, sets the Cardinal spline interpolation tension to the specified number in the range [0, 1]. If tension is not specified, returns the current tension. The tension only affects the Cardinal interpolation modes: cardinal, cardinal-open and cardinal-closed. The default tension is 0.7. In some sense, this can be interpreted as the length of the tangent; 1 will yield all zero tangents, and 0 yields a Catmull-Rom spline. Note that the tension must be specified as a constant, rather than a function, as it is constant for the entirety of the area. 
	*/
	@:overload(function():Float { } )
	function tension(tension:Float = 0.7):Array<Dynamic>->String;
	
	@:overload(function():Callb<Dynamic->Int->Bool> { } )
	function defined(defined:Callb<Dynamic->Int->Bool>):Area;
	
	/**
	 
	*/
	static function radial():RadialArea;
}


@:enum abstract AreaInterpMod(String) to String {
	
	var LINEAR = "linear";
	
	var STEP = "step";
	
	var STEP_BEFORE = "step-before";
	
	var STEP_AFTER = "step-after";
	
	var BASIS = "basis";
	
	var BASIS_OPEN = "basis-open";
	
	var CARDINAL = "cardinal";
	
	var CARDINAL_OPEN = "cardinal-open";
	
	var MONOTONE = "monotone";
}

extern class RadialArea{
	/**
	Returns the path data string for the specified array of data elements. 
	*/
	@:selfCall var selfCall:Array<Dynamic>->String;
	
	/**
	See the Area.x. 
	*/
	@:overload(function():Float { } )
	@:overload(function(x:Float):RadialArea { } )
	@:overload(function():Dynamic->Float { } )
	function radius(func:Dynamic->Float):RadialArea;
	
	/**
	See the Area.x0. 
	*/
	@:overload(function():Float { } )
	@:overload(function(x:Float):RadialArea { } )
	@:overload(function():Dynamic->Float { } )
	function innerRadius(func:Dynamic->Float):RadialArea;
	
	/**
	See the Area.x1. 
	*/
	@:overload(function():Float { } )
	@:overload(function(x:Float):RadialArea { } )
	@:overload(function():Dynamic->Float { } )
	function outerRadius(func:Dynamic->Float):RadialArea;
	
	/**
	See the Area.y. 
	*/
	@:overload(function():Float { } )
	@:overload(function(x:Float):RadialArea { } )
	@:overload(function():Dynamic->Float { } )
	function angle(func:Dynamic->Float):RadialArea;
	
	/**
	See the Area.y0. 
	*/	
	@:overload(function():Float { } )
	@:overload(function(x:Float):RadialArea { } )
	@:overload(function():Dynamic->Float { } )
	function startAngle(func:Dynamic->Float):RadialArea;
	
	/**
	See the Area.y1. 
	*/
	@:overload(function():Float { } )
	@:overload(function(x:Float):RadialArea { } )
	@:overload(function():Dynamic->Float { } )
	function endAngle(func:Dynamic->Float):RadialArea;
	
	/**
	See the Area.interpolate method. 
	*/
	@:overload(function():Array<Array<Float>>->String { } )
	@:overload(function(func:Array<Array<Float>>->String):RadialArea { } )
	@:overload(function():String{ } )
	function interpolate(interpolate:String):RadialArea;
	
	/**
	See the Area.tension method. 
	*/
	@:overload(function():Float { } )
	function tension(tension:Float = 0.7):Array<Dynamic>->String;
	
	/**
	See the Area.defined method. 
	*/
	@:overload(function():Callb<Dynamic->Int->Bool> { } )
	function defined(defined:Callb<Dynamic->Int->Bool>):RadialArea;
}