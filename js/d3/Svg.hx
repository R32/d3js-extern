package js.d3;

import js.d3.svg.Area;
import js.d3.svg.Line;

/**
SVG has a number of built-in simple shapes, such as axis-aligned rectangles and circles. For greater flexibility, you can use SVG's path element in conjunction with D3's path data generators.

A shape generator, such as that returned by d3.svg.arc, is both an object and a function. That is: you can call the shape like any other function, and the shape has additional methods that change its behavior. Like other classes in D3, shapes follow the method chaining pattern where setter methods return the shape itself, allowing multiple setters to be invoked in a concise statement.

https://github.com/mbostock/d3/wiki/SVG-Shapes
*/
extern class Svg{
	
	/**
	Constructs a new line generator with the default x- and y-accessor functions (that assume the input data is a two-element array of numbers; see below for details), and linear interpolation. The returned function generates path data for an open piecewise linear curve, or polyline, as in a line chart: 
	
	By changing the interpolation, you can also generate splines and step functions. Also, don't be afraid to tack on additional path commands at the end. For example, if you want to generate a closed path, append a closepath (Z) command:

	```js
	g.append("path")
		.attr("d", function(d) { return line(d) + "Z"; });
	```	

	The line generator is designed to work in conjunction with the area generator. For example, when producing an area chart, you might use an area generator with a fill style, and a line generator with a stroke style to emphasize the top edge of the area. Since the line generator is only used to set the d attribute, you can control the appearance of the line using standard SVG styles and attributes, such as fill, stroke and stroke-width.
	*/
	function line():Line;
	
	/**
	Constructs a new area generator with the default x-, y0- and y1-accessor functions (that assume the input data is a two-element array of numbers; see below for details), and linear interpolation. The returned function generates path data for a closed piecewise linear curve, or polygon, as in an area chart: 
	*/
	function area():Area;
}