package js.d3.svg;

import haxe.extern.EitherType;
import haxe.Constraints.Function;
import js.d3.Transition;
/**
https://github.com/mbostock/d3/wiki/SVG-Shapes

A path generator, such as that returned by d3.svg.line, is both an object and a function. That is: you can call the generator like any other function, and the generator has additional methods that change its behavior. Like other classes in D3, path generators follow the method chaining pattern where setter methods return the generator itself, allowing multiple setters to be invoked in a concise statement.
*/
@:native("d3.svg.line") extern class Line{
	
	/**
	Returns the path data string for the specified array of data elements, or null if the path is empty. 
	*/
	@:selfCall var selfCall:Array<Dynamic>->String;
	
	
	/**
	If x is specified, sets the x-accessor to the specified __function__ or __constant__. If x is not specified, returns the current x-accessor. This accessor is invoked for each element in the data array passed to the line generator. The default accessor assumes that each input element is a two-element array of numbers: 

	```js
	function x(d) {
		return d[0];
	}
	```

	Typically, an x-accessor is specified because the input data is in a different format, or because you want to apply a scale. For example, if your data is specified as an object with x and y attributes, rather than a tuple, you might dereference these attributes and apply the scales simultaneously:

	```js
	var x = d3.scale.linear().range([0, w]),
    y = d3.scale.linear().range([h, 0]);

	var line = d3.svg.line()
		.x(function(d) { return x(d.x); })
		.y(function(d) { return y(d.y); });
	```
	
	The x-accessor is invoked in the same manner as other value functions in D3. The this context of the function is the current element in the selection. (Technically, the same this context that invokes the line function; however, in the common case that the line generator is passed to the attr operator, the this context will be the associated DOM element.) The function is passed two arguments, the current datum (d) and the current index (i). In this context, the index is the index into the array of control points, rather than the index of the current element in the selection. The x-accessor is invoked exactly once per datum, in the order specified by the data array. Thus, it is possible to specify a nondeterministic accessor, such as a random number generator. It is also possible to specify the x-accessor as a constant rather than a function, in which case all points will have the same x-coordinate.
	*/
	@:overload(function():Dynamic->Float { } )
	@:overload(function(func:Dynamic->Float):Line { } )
	@:overload(function():Float { } )
	function x(x:Float):Line;
	
	/**
	If y is specified, sets the y-accessor to the specified function or constant. If y is not specified, returns the current y-accessor.  
	*/
	@:overload(function():Dynamic->Float { } )
	@:overload(function(func:Dynamic->Float):Line { } )
	@:overload(function():Float { } )
	function y(y:Float):Line;
	
	/**
	If interpolate is specified, sets the interpolation mode to the specified string or function. If interpolate is not specified, returns the current interpolation mode. The following named interpolation modes are supported: 
	
	- linear - piecewise linear segments, as in a polyline.

	- linear-closed - close the linear segments to form a polygon.

	- step - alternate between horizontal and vertical segments, as in a step function.

	- step-before - alternate between vertical and horizontal segments, as in a step function.

	- step-after - alternate between horizontal and vertical segments, as in a step function.

	- basis - a B-spline, with control point duplication on the ends.

	- basis-open - an open B-spline; may not intersect the start or end.

	- basis-closed - a closed B-spline, as in a loop.

	- bundle - equivalent to basis, except the tension parameter is used to straighten the spline.

	- cardinal - a Cardinal spline, with control point duplication on the ends.

	- cardinal-open - an open Cardinal spline; may not intersect the start or end, but will intersect other control points.

	- cardinal-closed - a closed Cardinal spline, as in a loop.

	- monotone - cubic interpolation that preserves monotonicity in y.
	
	The behavior of some of these interpolation modes may be further customized by specifying a tension.

	If interpolate is a function, then this function will be invoked to convert an array of points of the form [​[x0, y0], [x1, y1], …], returning an SVG path data string that will be used to display the line. The "M" at the start of the string is implied and should not be returned. For example, linear interpolation is implemented as:

	```js
	function interpolateLinear(points) {
	  return points.join("L");
	}
	This is equivalent to (and more efficient than):

	function interpolateLinear(points) {
	  var path = "";
	  for (var i = 0; i < points.length; i++) {
		if (i) path += "L";
		path += points[i][0] + "," + points[i][1];
	  }
	  return path;
	}
	```

	See bl.ocks.org/3310323 for another example of custom line interpolation.
	*/
	@:overload(function():Array<Array<Float>>->String { } )
	@:overload(function(func:Array<Array<Float>>->String):Line { } )
	@:overload(function():String{ } )
	function interpolate(interpolate:String):Line;
	
	/**
	If tension is specified, sets the Cardinal spline interpolation tension to the specified number in the range [0, 1]. If tension is not specified, returns the current tension. The tension only affects the <b>Cardinal interpolation modes</b>: cardinal, cardinal-open and cardinal-closed. The default tension is 0.7. In some sense, this can be interpreted as the length of the tangent; 1 will yield all zero tangents, and 0 yields a Catmull-Rom spline.

	Note that the tension must be specified as a constant, rather than a function, as it is constant for the entirety of the line. However, it is still possible to generate multiple lines with different tensions using the same generator. For example:

	```js
	svg.selectAll("path")
		.data([0, 0.2, 0.4, 0.6, 0.8, 1])
	  .enter().append("path")
		.attr("d", function(d) { return line.tension(d)(data); });
	```

	In this example (see the live version), the tension is set before each invocation of the line generator, thus resulting in lines with the same data but different paths. 
	*/
	@:overload(function():Float { } )
	function tension(tension:Float):Array<Dynamic>->String;
	
	/**
	Gets or sets the accessor function that controls where the line is defined. If defined is specified, sets the new accessor function and returns the line. If defined is not specified, returns the current accessor which defaults to function() { return true; }. The defined accessor can be used to define where the line is defined and undefined, which is typically useful in conjunction with missing data; the generated path data will automatically be broken into multiple distinct subpaths, skipping undefined data. For example, if you want to ignore y-values that are not a number (or undefined), you can say:

	```js
	line.defined(function(d) { return !isNaN(d[1]); });
	```

	If a datum is defined but surrounded by undefined data (or the end of the array), that datum will not be visible. 
	*/
	@:overload(function():Callb<Dynamic->Int->Bool> { } )
	function defined(defined:Callb<Dynamic->Int->Bool>):Line;
	
	
	/**
	Constructs a new radial line generator with the default radius- and angle-accessor functions (that assume the input data is a two-element array of numbers; see below for details), and linear interpolation. The returned function generates path data for an open piecewise linear curve, or polyline, as with the Cartesian line generator. 
	*/
	static function radial():RadialLine;
}

@:enum abstract LineInterpMod(String) to String {
	
	var LINEAR = "linear";
	
	var LINEAR_CLOSED = "linear-closed";
	
	var STEP = "step";
	
	var STEP_BEFORE = "step-before";
	
	var STEP_AFTER = "step-after";
	
	var BASIS = "basis";
	
	var BASIS_OPEN = "basis-open";
	
	var BASIS_CLOSED = "basis-closed";
	
	var BUNDLE = "bundle";
	
	var CARDINAL = "cardinal";
	
	var CARDINAL_OPEN = "cardinal-open";
	
	var CARDINAL_CLOSED = "cardinal-closed";
	
	var MONOTONE = "monotone";
}

/**
 
*/
extern class RadialLine {
	/**
	Returns the path data string for the specified array of data elements.
	*/
	@:selfCall var selfCall:Array<Dynamic>->String;
	
	
	/**
	This method is a transformation of the Cartesian line.x method. 
	*/
	@:overload(function():Dynamic->Float { } )
	@:overload(function(func:Dynamic->Float):RadialLine { } )
	@:overload(function():Float { } )
	function radius(r:Float):RadialLine;
	
	
	/**
	This method is a transformation of the Cartesian line.y method. 
	*/
	@:overload(function():Dynamic->Float { } )
	@:overload(function(func:Dynamic->Float):RadialLine { } )
	@:overload(function():Float { } )
	function angle(angle:Float):RadialLine;
	
	/**
	See the Cartesian line.interpolate method 
	*/
	@:overload(function():Array<Array<Float>>->String { } )
	@:overload(function(func:Array<Array<Float>>->String):RadialLine { } )
	@:overload(function():String{ } )
	function interpolate(interpolate:String):RadialLine;
	
	/**
	See the Cartesian line.tension method 
	*/
	@:overload(function():Float { } )
	function tension(tension:Float):Array<Dynamic>->String;
	
	/**
	See the Cartesian line.defined method. 
	*/
	@:overload(function():Callb<Dynamic->Int->Bool> { } )
	function defined(defined:Callb<Dynamic->Int->Bool>):RadialLine;
}