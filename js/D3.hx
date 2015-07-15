package js;







import js.html.Node;
import haxe.Constraints.Function;
import js.html.XMLHttpRequest;

import js.d3.Selection;
import js.d3.Transition;
import js.d3.arrays.Map;
import js.d3.arrays.Set;
import js.d3.arrays.Nest;
import js.d3.FlxEase;
import js.d3.Color;
import js.d3.Locale;
import js.d3.Time;
import js.d3.Behavior;
import js.d3.math.Random;
import js.d3.math.Transform;
import js.d3.Primitive;
import js.d3.XHR;
import js.d3.Timer;
import js.d3.format.*;		// csv, tsv, xhrr
import js.d3.Geo;

typedef Number = Null<haxe.extern.EitherType<Int,Float>>;

/**
https://github.com/mbostock/d3/wiki/API-Reference 
*/
@:native("d3")
extern class D3{
	
	static var version(default,null):String;
	
	
	//-=-=-=-=-=-=-=-=- Selections -=-=-=-=-=-=-=-=-
	/**
	Stores the current event, if any. This global is registered during an event listener callback with the on operator. The current event is reset after the listener is notified in a finally block. This allows the listener function to have the same form as other operator functions, being passed the current datum d and index i.

	The d3.event object is a DOM event and implements the standard event fields like `timeStamp` and `keyCode` as well as methods like preventDefault() and stopPropagation(). While you can use the native event's pageX and pageY, it is often more convenient to transform the event position to the local coordinate system of the container that received the event. For example, if you embed an SVG in the normal flow of your page, you may want the event position relative to the top-left corner of the SVG image. If your SVG contains transforms, you might also want to know the position of the event relative to those transforms. Use the d3.mouse operator for the standard mouse pointer, and use d3.touches for multitouch events on iOS.
	
	这个属性只能在事件回调函数中访问, 不同的事件其对应的事件也不一样, 其它地方将返回 null.
	*/
	static var event(default, null):Dynamic;		// Any Event
	
	
	/**
	Returns the x and y coordinates of the current d3.event. The container may be an HTML or SVG container element, such as an svg:g or svg:svg. The coordinates are returned as a two-element array [x, y].
	*/
	static function mouse(container:Node):Array<Float>;
	
	
	/**
	Returns the x and y coordinates of the touch with the specified identifier associated with the current d3.event, relative to the specified container. If touches is not specified, defaults to the current event’s changedTouches. The container may be an HTML or SVG container element, such as an svg:g or svg:svg. The coordinates are returned as an array of two-element arrays `[ [ x1, y1], [ x2, y2], … ]`. If there is no touch with the specified identifier in touches, returns null; this can be useful for ignoring touchmove events where the only some touches have moved.
	*/
	@:overload(function(container:Node, identifier:Int):Array<Array<Float>>{})
	static function touch(container:Node, touches:js.html.TouchList, identifier:Int):Array<Array<Float>>;
	
	
	/**
	Returns the x and y coordinates of each touch associated with the current d3.event, based on the touches attribute, relative to the specified container. The container may be an HTML or SVG container element, such as an svg:g or svg:svg. The coordinates are returned as an array of two-element arrays [ [ x1, y1], [ x2, y2], … ]. If touches is specified, returns the positions of the specified touches; if touches is not specified, it defaults to the touches property on the current event. 
	*/
	static function touches(contaner:Node, ?touches:js.html.TouchList):Array<Array<Float>>;
	
	/**
	Selects the first element that matches the specified selector string, returning a single-element selection. If no elements in the current document match the specified selector, returns the empty selection. If multiple elements match the selector, only the first matching element (in document traversal order) will be selected.
	
	Selects the specified node. This is useful if you already have a reference to a node, such as `d3.select(this)` within an event listener, or a global such as `document.body`. This function does not traverse the `DOM`.
	*/
	@:overload(function(node:Node):Selection{})
	static function select(query:String):Selection;
	
	/**
	Selects all elements that match the specified selector. The elements will be selected in document traversal order (top-to-bottom). If no elements in the current document match the specified selector, returns the empty selection.
	
	Selects the specified array of elements. This is useful if you already have a reference to nodes, such as `d3.selectAll(this.childNodes)` within an event listener, or a global such as document.links. The nodes argument doesn't have to be an array, exactly; any pseudo-array that can be coerced into an array (e.g., `a NodeList or arguments`) will work. This function does not traverse the `DOM`.
	*/
	@:overload(function(nodes:Array<Node>):Selection{})
	static function selectAll(query:String):Selection;
	
	
	/**
	Returns the root selection, equivalent to `d3.select(document.documentElement)`. This function can also be used to check if an object is a selection: `o instanceof d3.selection`. You can also add new methods to the selection prototype. For example, to add a convenience method for setting the "checked" property of checkboxes, you might say: 
	
	```js
	d3.selection.prototype.checked = function(value) {
		return arguments.length < 1
			? this.property("checked")
			: this.property("checked", value);
	};
	
	console.log(obj instanceof d3.selection);
	
	console.log(d3.selection().node() === d3.transition().node());		// true
	```
	*/
	static var selection(default, null):Void->Selection;				//	haxe.Constraints.Function;
	
	// TODO: -=-=-=-=-=-=-=-=- Internals -=-=-=-=-=-=-=-=-
	
	// -=-=-=-=-=-=-=-=- Math -=-=-=-=-=-=-=-=-
	
	/**
	Pseudorandom Number Generation 
	*/
	static var random(default, null):Random;
	
	/**
	Parses the given 2D affine transform string, as defined by SVG's transform attribute. The transform is then decomposed to an object with fields for translate, rotate, x-skew and scale. This behavior is standardized by CSS: see matrix decomposition for animation. 
	
	zh-CN: 
	*/
	static function transform(?css:String):Transform;
	
	// -=-=-=-=-=-=-=-=- Working with Arrays -=-=-=-=-=-=-=-=-
	
	/**
	Returns -1 if a is less than b, or 1 if a is greater than b, or 0. This is the comparator function for natural order, and can be used in conjunction with the built-in array sort method to arrange elements in ascending order. 
	*/
	static function ascending<T>(a:T, b:T):Int;
	
	/**
	Returns -1 if a is greater than b, or 1 if a is less than b, or 0. This is the comparator function for reverse natural order, and can be used in conjunction with the built-in array sort method to arrange elements in descending order
	*/
	static function descending<T>(a:T, b:T):Int;
	
	/**
	Returns the minimum value in the given array using natural order. If the array is empty, returns undefined. An optional accessor function may be specified, which is equivalent to calling array.map(accessor) before computing the minimum value. Unlike the built-in Math.min, this method ignores undefined values; this is useful for computing the domain of a scale while only considering the defined region of the data. In addition, elements are compared using natural order rather than numeric order. For example, the minimum of ["20", "3"] is "20", while the minimum of [20, 3] is 3.
	
	`function accessor(val:T, index:Int):S{ this-> array}`
	*/
	static function min(arr:Array<Number>, ?accessor:Number->Int->Number):Number;
	
	
	static function max(arr:Array<Number>, ?accessor:Number->Int->Number):Number;
	
	/**
	Returns the minimum and maximum value in the given array using natural order. This is equivalent to calling d3.min and d3.max simultaneously. 
	*/
	static function extent(arr:Array<Number>, ?accessor:Number->Int->Number):Array<Number>;
	
	
	/**
	Returns the sum of the given array. If the array is empty, returns 0. An optional accessor function may be specified, which is equivalent to calling array.map(accessor) before computing the sum. This method ignores invalid values such as NaN and undefined; this is useful for computing the sum of data while only considering the well-defined values. 
	
	用于数字类型, 回调函数可以修改每个值, 但如果返回非数字值将被忽略
	*/
	static function sum(arr:Array<Number>,  ?accessor:Number->Int->Number):Number;
	
	/**
	Returns the mean of the given array. If the array is empty, returns undefined. An optional accessor function may be specified, which is equivalent to calling array.map(accessor) before computing the mean. This method ignores invalid values such as NaN and undefined; this is useful for computing the mean of data while only considering the well-defined values. 
	
	平均值
	*/
	static function mean(arr:Array<Number>,  ?accessor:Number->Int->Number):Number;
	
	
	/**
	Returns the median of the given array using the [R-7](http://en.wikipedia.org/wiki/Quantile#Quantiles_of_a_population) algorithm. If the array is empty, returns undefined. An optional accessor function may be specified, which is equivalent to calling array.map(accessor) before computing the median. This method ignores invalid values such as NaN and undefined; this is useful for computing the median of data while only considering the well-defined values. 
	
	中值.  `d3.dedian([5,1,7,18]) == (5+7)/2`
	*/
	static function median(arr:Array<Number>,  ?accessor:Number->Int->Number):Number;
	
	
	/**
	Returns the p-quantile of the given sorted array of numbers, where p is a number in the range [0,1]. For example, the median can be computed using p = 0.5, the first quartile at p = 0.25, and the third quartile at p = 0.75. This particular implementation uses the R-7 algorithm, which is the default for the R programming language and Excel. This method requires that numbers contains numeric elements and is already sorted in ascending order, such as by `d3.ascending`.
	
	```js
	var a = [0, 1, 3];
	d3.quantile(a, 0);		// 0
	d3.quantile(a, 0.5);	// 1
	d3.quantile(a, 1);		// 3
	d3.quantile(a, 0.25);	// 0.5
	d3.quantile(a, 0.75);	// 2
	d3.quantile(a, 0.1);	// 0.19999999999999996 
	```
	*/
	static function quantile(arr:Array<Number>, p:Number):Number;
	
	/**
	Returns an [unbiased estimator of the population variance](http://mathworld.wolfram.com/SampleVariance.html) of the given array of numbers. If the array has fewer than two values, returns undefined. An optional accessor function may be specified, which is equivalent to calling array.map(accessor) before computing the variance. This method ignores invalid values such as `NaN` and `undefined`. 
	*/
	static function variance(arr:Array<Number>,  ?accessor:Number->Int->Number):Number;
	
	/**
	Returns the standard deviation, defined as the square root of the [bias-corrected variance](https://github.com/mbostock/d3/wiki/Arrays#d3_variance), of the given array of numbers. If the array has fewer than two values, returns undefined. An optional accessor function may be specified, which is equivalent to calling array.map(accessor) before computing the standard deviation. This method ignores invalid values such as `NaN` and `undefined`. 
	*/
	static function deviation(arr:Array<Number>,  ?accessor:Number->Int->Number):Number;
	
	/**
	Locate the insertion point for x in array to maintain sorted order. The arguments lo and hi may be used to specify a subset of the array which should be considered; by default the entire array is used. If x is already present in array, the insertion point will be before (to the left of) any existing entries. 
	
	The return value is suitable for use as the first argument to splice assuming that array is already sorted. The returned insertion point i partitions the array into two halves so that all v < x for v in array.slice(lo, i) for the left side and all v >= x for v in array.slice(i, hi) for the right side. 
	
	虽然参数 lo 与 hi 可用于指定 arr 的区域, 但返回的结果仍然是基于 arr 的索引
	*/
	static function bisectLeft(arr:Array<Number>,n:Number, ?lo:Int, ?hi:Int ):Int;
	
	/**
	equal bisectRight 
	*/
	static function bisect(arr:Array<Number>, n:Number, ?lo:Int, ?hi:Int ):Int;
	
	/**
	Similar to bisectLeft, but returns an insertion point which comes after (to the right of) any existing entries of x in array. The returned insertion point i partitions the array into two halves so that all v <= x for v in array.slice(lo, i) for the left side and all v > x for v in array.slice(i, hi) for the right side.
	*/
	static function bisectRight(arr:Array<Number>, n:Number, ?lo:Int, ?hi:Int ):Int;
	
	/**
	Returns a bisector using the specified accessor or comparator function. The returned object has left and right properties which are similar to bisectLeft and bisectRight, respectively. This method can be used to bisect arrays of objects instead of being limited to simple arrays of primitives. For example, given the following array of objects:
	
	```js
	var data = [
		{date: new Date(2011, 1, 1), value: 0.5},
		{date: new Date(2011, 2, 1), value: 0.6},
		{date: new Date(2011, 3, 1), value: 0.7},
		{date: new Date(2011, 4, 1), value: 0.8}
	];
	```
	
	A suitable bisect function could be constructed as:
	
	```js
	var bisect = d3.bisector(function(d) { return d.date; }).right;
	```
	
	This is equivalent to specifying a comparator:
	
	```js
	var bisect = d3.bisector(function(a, b) { return a.date - b.date; }).right;
	```
	
	And then applied as `bisect(data, new Date(2011, 1, 2))`, returning an index. Use a comparator rather than an accessor if you want values to be sorted in an order different than natural order, such as in descending rather than ascending order.
	
	*/
	@:overload(function(comparator:Callb<Dynamic->Dynamic->Dynamic>):{left:Function,right:Function}{})
	static function bisector(accessor:Callb<Dynamic->Dynamic>):{left:Function,right:Function};
	
	/**
	Randomizes the order of the specified array using the [Fisher–Yates shuffle](http://bost.ocks.org/mike/shuffle/). 
	*/
	static function shuffle(arr:Array<Number>, ?lo:Int, ?hi:Int ):Int;
	
	/**
	Returns an array containing the property names of the specified object (an associative array). The order of the returned array is undefined. 
	*/
	static function keys(obj: {} ):Array<String>;
	
	/**
	Returns an array containing the property values of the specified object (an associative array). The order of the returned array is undefined. 
	*/
	static function values(obj: { } ):Array<Dynamic>;
	
	
	/**
	Returns an array containing the property keys and values of the specified object (an associative array). Each entry is an object with a key and value attribute, such as `{key: "foo", value: 42}`. The order of the returned array is undefined. 
	
	```js
	d3.entries({foo: 42, bar: true}); 
	
	//output:  [{key: "foo", value: 42}, {key: "bar", value: true}]
	```
	
	*/
	static function entries(obj: { } ):Array<{}>;
	
	/**
	Merges the specified arrays into a single array. This method is similar to the built-in array concat method; the only difference is that it is more convenient when you have an array of arrays. 
	
	```js
	d3.merge([ [1], [2, 3] ]);	// returns [1, 2, 3]
	```
	*/
	static function merge<T>(arrs:Array<Array<T>>):Array<T>;
	
	/**
	Generates an array containing an arithmetic progression, similar to the Python built-in range. This method is often used to iterate over a sequence of numeric or integer values, such as the indexes into an array.
	
	Unlike the Python version, the arguments are not required to be integers, though the results are more predictable if they are due to floating point precision. If step is omitted, it defaults to 1. If start is omitted, it defaults to 0. The stop value is not included in the result. The full form returns an array of numbers [start, start + step, start + 2 * step, …]. If step is positive, the last element is the largest start + i * step less than stop; if step is negative, the last element is the smallest start + i * step greater than stop. If the returned array would contain an infinite number of values, an error is thrown rather than causing an infinite loop. 
	*/
	static function range(?start:Number, stop:Number, ?step:Number):Array<Number>;
	
	/**
	Returns a permutation of the specified array using the specified array of indexes. The returned array contains the corresponding element in array for each index in indexes, in order. For example, `permute(["a", "b", "c"], [1, 2, 0]) returns ["b", "c", "a"]`. It is acceptable for the array of indexes to be a different length from the array of elements, and for indexes to be duplicated or omitted.

	This method can also be used to extract the values from an object into an array with a stable order. (Array indexes in JavaScript are simply properties which have a special relationship to .length.) Extracting keyed values in order can be useful for generating data arrays in nested selections. For example, we could display some of the Minnesota barley yield data above in table form: 
	
	```js
	var cols = ["site", "variety", "yield"];
	thead.selectAll('th').data(cols)
		.enter().append('th').text(function (d) { return d.toUpperCase(); });
	tbody.selectAll('tr').data(yields)
		.enter().append('tr').selectAll('td').data(function (row) { return d3.permute(row, cols); })
			.enter().append('td').text(function (d) { return d; });	
	```
	*/
	@:overload(function(obj:{length:Int}, keys:Array<String>):Array<Dynamic>{})
	static function permute(arr:Array<Dynamic>, indexes:Array<Int>):Array<Dynamic>;
	
	/**
	For each adjacent pair of elements in the specified array, returns a new array of tuples of element i and element i - 1. For example: 
	
	```js
	d3.pairs([1, 2, 3, 4]); // returns [[1, 2], [2, 3], [3, 4]]
	```
	*/
	static function pairs<T>(arr:Array<T>):Array<Array<T>>;
	
	/**
	Returns an array of arrays, where the ith array contains the ith element from each of the argument arrays. The returned array is truncated in length to the shortest array in arrays. If arrays contains only a single array, the returned array contains one-element arrays. With no arguments, the returned array is empty.
	
	```js
	d3.zip([1, 2], [3, 4]); // returns [[1, 3], [2, 4]]
	```
	*/
	static function zip<T>(rest:haxe.extern.Rest<Array<T>>):Array<Array<T>>;
	
	/**
	Equivalent to `d3.zip.apply(null, matrix)`; uses the zip operator as a two-dimensional matrix transpose.
	*/
	static function transpose<T>(matrix:Array<Array<T>>):Array<Array<T>>;
	
	
	/**
	Constructs a new map. If object is specified, copies all enumerable properties from the specified object into this map. 
	
	The specified object may be an array. An optional key function may be specified to compute the key for each value in the array. For example:
	
	```js
	var m = d3.map([{name: "foo"}, {name: "bar"}], function(d) { return d.name; });
	m.get("foo"); // {"name": "foo"}
	m.get("bar"); // {"name": "bar"}
	m.get("baz"); // undefined
	```
	*/
	@:overload(function(arr:Array<{}>, key:Callb<{}->String>):Map { } )
	static function map(?obj: { } ):Map;
	
	/**
	Constructs a new set. If array is specified, adds the given array of string values to the returned set. 
	*/
	static function set(?arr:Array<String>):Set;
	
	
	/**
	Creates a new nest operator. The set of keys is initially empty. If the map or entries operator is invoked before any key functions are registered, the nest operator simply returns the input array. Examples of nest: http://bl.ocks.org/phoebebright/raw/3176159/ 
	*/
	static function nest():Nest;
	
	
	//-=-=-=-=-=-=-=-=- Transitions -=-=-=-=-=-=-=-=-
	
	
	/**	
	Create an animated transition. This is equivalent to d3.select(document).transition(). This method is used rarely, as it is typically easier to derive a transition from an existing selection, rather than deriving a selection from an existing transition. If name is specified, create a transition with the specified name; otherwise, use the empty name (“”).
	
	When called with an optional selection, this method typically returns the specified selection; i.e., it is a no-op. However, within the context of transition.each, this method will create a new transition for the specified selection that inherits the delay, duration and other properties of the parent transition. This is useful for implementing reusable components that can be called either on selections or on transitions, in the latter case supporting deriving concurrent transitions. An example of this is D3’s axis component.
	
	 - 空参数,相当于快速调用 `select("html").transition()` == (如果第一个参数为非 Selection 值, 第二个参数将被忽略).
	 
	 - 如果第一个参数为 Selection,但是如果不符合要求(要求见英文.TODO:x), 将返回这个 Selection,
	 
	 - 用于 transition.each 的遍历内部 将创建 inherit 类型的 transition.
	 
	 ```js
	 d3.select("p")
		.transition("hi")
		.delay(500)
		.each(function(){ 
			console.log( d3.transition(d3.select(this),"hi").delay() )	// 返回前边继承的 500
		})
	 ```
	*/
	@:overload(function(?selection:Selection, ?name:String):Transition{})
	static function transition(?selection:Selection, ?name:String):Selection;
	
	/**
	The default easing function is "cubic-in-out" which provides suitable slow-in slow-out animation
	*/
	
	static function ease(type:EaseType, rest:haxe.extern.Rest<Float>):EaseFunction;

	
	static var timer(default,null):Timer;
	
	// --------------- Interpolation ---------------
	
	/**
	D3 has many built-in interpolators to simplify the transitioning of arbitrary values; an interpolator is a function that maps a parametric value t in the domain [0,1] to a color, number or arbitrary value. 

	Returns the default interpolator between the two values a and b. The type of interpolator is based on the type of the end value b, using the following algorithm:

	 1. If b is a color, interpolateRgb is used.
 
	 2. If b is a string, interpolateString is used.
 
	 3. If b is an array, interpolateArray is used.
 
	 4. If b is an object and not coercible to a number, interpolateObject is used.
 
	 5. Otherwise, interpolateNumber is used.
 
	Based on the chosen interpolator, a is coerced to a suitable corresponding type. The color check applies to both instances of d3.rgb and other color spaces as well as color strings of the form /^(#|rgb\(|hsl\()/ or a CSS named colors.

	The behavior of this default interpolator may be extended to support additional types by pushing custom interpolators onto the d3.interpolators array. 	 
	*/
	static function interpolate<T>(a:T, b:T):InterpFunction<T>;
	
	/**
	Returns a numeric interpolator between the two numbers a and b. The returned interpolator is equivalent to:
	
	```js
	function interpolate(t) {
		return a * (1 - t) + b * t;
	}
	```
	
	Caution: avoid interpolating to or from the number zero when the interpolator is used to generate a string (such as with attr). Very small values, when stringified, may be converted to scientific notation and cause a temporarily invalid attribute or style property value. For example, the number `0.0000001` is converted to the string "1e-7". This is particularly noticeable when interpolating opacity values. To avoid scientific notation, start or end the transition at `1e-6`, which is the smallest value that is not stringified in exponential notation.
	*/
	static function interpolateNumber(a:Float, b:Float):InterpFunction<Float>;
	
	/**
	Returns a numeric interpolator between the two numbers a and b; the interpolator is similar to interpolateNumber, except it will round the resulting value to the nearest integer. 
	*/
	static function interpolateRound(a:Int, b:Int):InterpFunction<Int>;
	
	/**
	Returns a string interpolator between the two strings a and b. The string interpolator finds numbers embedded in a and b, where each number is of the form:
	
	```js
	/[-+]?(?:\d+\.?\d*|\.?\d+)(?:[eE][-+]?\d+)?/g
	```
	
	For each number embedded in b, the interpolator will attempt to find a corresponding number in a. If a corresponding number is found, a numeric interpolator is created using interpolateNumber. The remaining parts of the string b are used as a template: the static parts of the string b remain constant for the interpolation, with the interpolated numeric values embedded in the template. For example, if a is "300 12px sans-serif", and b is "500 36px Comic-Sans", two embedded numbers are found. The remaining static parts of the string are a space between the two numbers (" "), and the suffix ("px Comic-Sans"). The result of the interpolator at t = .5 is "400 24px Comic-Sans".
	*/
	static function interpolateString(a:String, b:String):InterpFunction<String>;
	
	/**
	Returns an RGB color space interpolator between the two colors a and b. The colors a and b need not be in RGB, but they will be converted to RGB using d3.rgb. The red, green and blue channels are interpolated linearly in a manner equivalent to interpolateRound, as fractional channel values are not allowed. The return value of the interpolator is a hexadecimal RGB string. 
	*/
	@:overload(function(a:String, b:String):InterpFunction<String>{})
	static function interpolateRgb(a:Rgb, b:Rgb):InterpFunction<String>;
	
	/**
	Returns an HSL color space interpolator between the two colors a and b. The colors a and b need not be in HSL, but they will be converted to HSL using d3.hsl. The hue, saturation and lightness are interpolated linearly in a manner equivalent to interpolateNumber. (The shortest path between the start and end hue is used.) The return value of the interpolator is a hexadecimal RGB string.  
	*/
	@:overload(function(a:String, b:String):InterpFunction<String>{})
	static function interpolateHsl(a:Hsl, b:Hsl):InterpFunction<String>;
	
	/**
	Returns an HCL color space interpolator between the two colors a and b. The colors a and b will be converted to HCL if necessary using d3.hcl. The color channels are then interpolated linearly in a manner equivalent to interpolateNumber. (The shortest path between the start and end hue is used.) The return value of the interpolator is a hexadecimal RGB string.
	*/
	@:overload(function(a:String, b:String):InterpFunction<String>{})
	static function interpolateHcl(a:Hcl, b:Hcl):InterpFunction<String>;
	
	/**
	Returns a L*a*b* color space interpolator between the two colors a and b. The colors a and b will be converted to L*a*\b* if necessary using d3.lab. The color channels are then interpolated linearly in a manner equivalent to interpolateNumber. The return value of the interpolator is a hexadecimal RGB string. 
	*/
	@:overload(function(a:String, b:String):InterpFunction<String>{})
	static function interpolateLab(a:Lab, b:Lab):InterpFunction<String>;
	
	/**
	Returns an array interpolator between the two arrays a and b. Internally, an array template is created that is the same length in b. For each element in b, if there exists a corresponding element in a, a generic interpolator is created for the two elements using interpolate. If there is no such element, the static value from b is used in the template. Then, for the given parameter t, the template's embedded interpolators are evaluated. The updated array template is then returned. For example, if a is the array [0, 1] and b is the array [1, 10, 100], then the result of the interpolator for t = .5 is the array [.5, 5.5, 100].

	Note: no defensive copy of the template array is created; modifications of the returned array may adversely affect subsequent evaluation of the interpolator. No copy is made because interpolators should be fast, as they are part of the inner loop of animation. 
	*/
	static function interpolateArray<T>(a:Array<T>, b:Array<T>):InterpFunction<Array<T>>;
	
	/**
	Returns an object interpolator between the two objects a and b. Internally, an object template is created that has the same properties as b. For each property in b, if there exists a corresponding property in a, a generic interpolator is created for the two elements using interpolate. If there is no such property, the static value from b is used in the template. Then, for the given parameter t, the template's embedded interpolators are evaluated and the updated object template is then returned. For example, if a is the object `{x: 0, y: 1}` and b is the object `{x: 1, y: 10, z: 100}`, the result of the interpolator for t = .5 is the object `{x: .5, y: 5.5, z: 100}`. 
	
	Object interpolation is particularly useful for dataspace interpolation, where data is interpolated rather than attribute values. For example, you can interpolate an object which describes an arc in a pie chart, and then use d3.svg.arc to compute the new SVG path data.

	Note: no defensive copy of the template object is created; modifications of the returned object may adversely affect subsequent evaluation of the interpolator. No copy is made because interpolators should be fast, as they are part of the inner loop of animation.
	*/
	static function interpolateObject<T:{}>(a:T, b:T):InterpFunction<T>;
	
	
	/**
	Returns an interpolator between the two 2D affine transforms represented by a and b. Each transform is decomposed to a standard representation of translate, rotate, x-skew and scale; these component transformations are then interpolated. This behavior is standardized by CSS: [see matrix decomposition for animation](http://www.w3.org/TR/css3-2d-transforms/#matrix-decomposition). 
	*/
	static function interpolateTransform(a:Transform, b:Transform):InterpFunction<Transform>;
	
	/**
	Returns a smooth interpolator between the two views a and b of a two-dimensional plane, based on “Smooth and efficient zooming and panning” by Jarke J. van Wijk and Wim A.A. Nuij. Each view is defined as an array of three numbers: cx, cy and width. The first two coordinates cx, cy represent the center of the viewport; the last coordinate width represents the size of the viewport. The returned interpolator also has a duration property which encodes the recommended transition duration in milliseconds. This duration is based on the path length of the curved trajectory through x,y space. If you want to a slower or faster transition, multiply this by an arbitrary scale factor (V as described in the original paper). 
	
	`[centerX, centerY, width]`
	*/
	static function interpolateZoom(a:Array<Float>, b:Array<Float>):InterpFunction<Array<Float>>;
	
	/**
	The array of built-in interpolator factories, as used by d3.interpolate. Additional interpolator factories may be pushed onto the end of this array. Each factory may return an interpolator, if it supports interpolating the two specified input values; otherwise, the factory should return a falsey value and other interpolators will be tried.
	
	For example, to register a custom interpolator that formats dollars and cents, you might say:
	
	```js
	d3.interpolators.push(function(a, b) {
		var re = /^\$([0-9,.]+)$/, ma, mb, f = d3.format(",.02f");
		if ((ma = re.exec(a)) && (mb = re.exec(b))) {
			a = parseFloat(ma[1]);
			b = parseFloat(mb[1]) - a;
			return function(t) {
				return "$" + f(a + b * t);
			};
		}
	});
	
	// Then, d3.interpolate("$20", "$10")(1/3) returns $16.67.
	```
	*/
	static var interpolators(default, null):Array<Interpolator<Dynamic>>;
	
	// -=-=-=-=-=-=-=-=-=- Colors -=-=-=-=-=-=-=-=-=-
	
	/**
	A d3.color base type is provided if you want to extend D3 with additional color spaces. This type enables automatic RGB interpolation by d3.interpolate (detected via instanceof d3.color). 
	
	zh-CN: 空函数,仅用于检测 instanceof
	*/
	static var color:Void->Void;
	
	/**
	Constructs a new RGB color with the specified r, g and b channel values. Each channel must be specified as an integer in the range [0,255]. The channels are available as the r, g and b attributes of the returned object. 
	
	Constructs a new RGB color by parsing the specified color string. If color is not a string, it is coerced to a string; thus, this constructor can also be used to create a copy of an existing color, or force the conversion of a d3.hsl color to RGB. The color string may be in a variety of formats:
	
	 - rgb decimal - "rgb(255,255,255)"
	
	 - hsl decimal - "hsl(120,50%,20%)"
	
	 - rgb hexadecimal - "#ffeeaa"
	
	 - rgb shorthand hexadecimal - "#fea"
	
	 - named - "red", "white", "blue"
	 
	The resulting color is stored as red, green and blue integer channel values in the range [0,255]. The channels are available as the r, g and b attributes of the returned object. The list of supported named colors is specified by CSS. If the color is specified in HSL space, it is converted to RGB in a manner equivalent to hsl.rgb.
	*/
	@:overload(function(rgb:Rgb):Rgb{})
	@:overload(function(color:String):Rgb{})
	static function rgb(r:Int = 0, g:Int = 0, b:Int = 0):Rgb;
	
	/**
	hsl color. `h= 0~360, s= 0~1.0, l= 0~1.0`;
	
	```js
	var h = d3.hsl("red")
	d3.hsl.call(h,300, 0.8, 0.5); 	// change value and return void; TODO: how to do it in haxe 
	```
	*/
	@:overload(function(hsl:Hsl):Hsl{})
	@:overload(function(color:String):Hsl { } )
	static function hsl(h:Int, s:Float, l:Float):Hsl;

	/**
	hcl color 
	*/
	@:overload(function(hcl:Hcl):Hcl{})
	@:overload(function(color:String):Hcl{})
	static function hcl(h:Float, c:Float, l:Float):Hcl;
	
	/**
	lab color 
	*/
	@:overload(function(lab:Lab):Lab{})
	@:overload(function(color:String):Lab{})
	static function lab(l:Float, a:Float, b:Float):Lab;
	
	
	// https://github.com/mbostock/d3/wiki/Formatting#d3_format
	// -=-=-=-=-=-=-=-=- String Formatting  -=-=-=-=-=-=-=-=-
	
	/**
	Formatting numbers is one of those things you don't normally think about until an ugly "0.30000000000000004" appears on your axis labels. Also, maybe you want to group thousands to improve readability, and use fixed precision, such as "$1,240.10". Or, maybe you want to display only the significant digits of a particular number. D3 makes this easy using a standard number format. For example, to create a function that zero-fills to four digits, say:
	
	```js
	var zero = d3.format("04d");
	
	// Now you can conveniently format numbers:
	
	zero(2);	// "0002"
	zero(123);	// "0123"
	```
	
	In addition to numbers, D3 also supports formatting and parsing [dates](https://github.com/mbostock/d3/wiki/Time-Formatting), and [comma-separated values](https://github.com/mbostock/d3/wiki/CSV).
	
	<hr />
	
	Returns a new format function with the given string specifier. (Equivalent to [locale.numberFormat](https://github.com/mbostock/d3/wiki/Localization#locale_numberFormat) for the default U.S. English locale.) A format function takes a number as the only argument, and returns a string representing the formatted number. The format specifier is modeled after Python 3.1's built-in [format specification mini-language](http://docs.python.org/release/3.1.3/library/string.html#formatspec). The general form of a specifier is:
	
	```bash
	[​[fill]align][sign][symbol][0][width][,][.precision][type]
	```
	
	The fill can be any character other than "{" or "}". The presence of a fill character is signaled by the character following it, which must be one of the align options.
	
	The align can be:
	
	 - `<` Forces the field to be left-aligned within the available space.
	
	 - `>` Forces the field to be right-aligned within the available space. (This is the default).

	 - `^` Forces the field to be centered within the available space.	
	 
	The sign can be:
	
	 - plus("+") - a sign should be used for both positive and negative numbers.

	 - minus("-") - a sign should be used only for negative numbers. (This is the default.)

	 - space(" ") - a leading space should be used on positive numbers, and a minus sign on negative numbers.
	 
	The symbol can be:
	
	 - currency("$") - a currency symbol should be prefixed (or suffixed) per the locale.

	 - base("#") - for binary, octal, or hexadecimal output, prefix by "0b", "0o", or "0x", respectively.
	 
	The "0" option enables zero-padding.
	
	The width defines the minimum field width. If not specified, then the width will be determined by the content.

	The comma (",") option enables the use of a comma for a thousands separator.

	The precision indicates how many digits should be displayed after the decimal point for a value formatted with types "f" and "%", or before and after the decimal point for a value formatted with types "g", "r" and "p".
	
	The available type values are:
	
	 - exponent ("e") - use Number.toExponential.
	 
	 - general ("g") - use Number.toPrecision.

	 - fixed ("f") - use Number.toFixed.

	 - integer ("d") - use Number.toString, but ignore any non-integer values.

	 - rounded ("r") - round to precision significant digits, padding with zeroes where necessary in similar fashion to fixed ("f"). If no precision is specified, falls back to general notation.

	 - percentage ("%") - like fixed, but multiply by 100 and suffix with "%".

	 - rounded percentage ("p") - like rounded, but multiply by 100 and suffix with "%".

	 - binary ("b") - outputs the number in base 2.

	 - octal ("o") - outputs the number in base 8.

	 - hexadecimal ("x") - outputs the number in base 16, using lower-case letters for the digits above 9.

	 - hexadecimal ("X") - outputs the number in base 16, using upper-case letters for the digits above 9.

	 - character ("c") - converts the integer to the corresponding unicode character before printing.

	 - SI-prefix ("s") - like rounded, but with a unit suffixed such as "9.5M" for mega, or "1.00µ" for micro.	
	  
	The type "n" is also supported as shorthand for ",g". 
	*/
	
	static function format(f:String):Number->String;
	
	/**
	Returns the SI prefix for the specified value. If an optional precision is specified, the value is rounded accordingly using d3.round before computing the prefix. The returned prefix object has two properties:

	 - symbol - the prefix symbol, such as "M" for millions.

	 - scale - the scale function, for converting numbers to the appropriate prefixed scale.

	For example:

	```
	var prefix = d3.formatPrefix(1.21e9);
	console.log(prefix.symbol); // "G"
	console.log(prefix.scale(1.21e9)); // 1.21
	```

	This method is used by d3.format for the s format. 
	*/
	static function formatPrefix(value:Float, ?precision:Int): { symbol:String, scale:Float->Float };
	
	
	/**
	Returns the value x rounded to n digits after the decimal point. If n is omitted, it defaults to zero. The result is a number. Values are rounded to the closest multiple of 10 to the power minus n; if two multiples are equally close, the value is rounded up in accordance with the built-in round function. For example:
	
	```js
	d3.round(1.23); // 1
	d3.round(1.23, 1); // 1.2
	d3.round(1.25, 1); // 1.3
	d3.round(12.5, 0); // 13
	d3.round(12, -1); // 10
	```
	*/
	static function round(x:Float, ?n:Int):Float;
	
	/**
	Returns a quoted (escaped) version of the specified string such that the string may be embedded in a regular expression as a string literal. 
	
	```js
	d3.requote("[]"); // "\[\]"
	```
	*/
	static function requote(s:String):String;
	
	
	// -=-=-=-=-=-=- Time Formatting -=-=-=-=-=-=-
	
	/**
	time format 
	*/
	static var time(default, null):Time;
	
	
	// -=-=-=-=-=-=- Localization -=-=-=-=-=-=-
	
	/**
	Returns a new locale given the specified definition. 
	*/
	static function locale(definition:LocaleDef):Locale;
	
	
	// -=-=-=-=-=-=- Behaviors -=-=-=-=-=-=-
	
	static var behavior(default, null):Behavior;
	
	// -=-=-=-=-=-=- Geo Paths -=-=-=-=-=-=-
	/**
	Geo Paths
	*/
	static var geo(default, null):Geo;
	
	// -=-=-=-=-=- CSV Formatting (d3.csv) -=-=-=-=-=-
	
	static var csv(default,null):CSV;
	
	static var tsv(default, null):TSV;
	
	/**
	Constructs a new parser for the given delimiter and mime type. For example, to parse values separated by "|", the vertical bar character, use:

	```js
	var dsv = d3.dsv("|", "text/plain"); 
	```
	*/
	static function dsv(delimiter:String, mimeType:String):DSV;
	
	// -=-=-=-=-=- Loading External Resources -=-=-=-=-=-
	/**
	Creates an asynchronous request for specified url. An optional mime type may be specified as the second argument, such as "text/plain". If a callback is specified, the request is immediately issued with the GET method and the callback is invoked asynchronously when the resource is loaded or the request fails; the callback is invoked with two arguments: the error, if any, and the XMLHttpRequest object representing the response. The response is undefined if an error occurs. If the response has an unsuccessful status code, the error is the XMLHttpRequest object. If no callback is specified, the returned request can be issued using xhr.get, xhr.post or similar, and handled using xhr.on. 
	*/
	@:overload(function(url:String, ?callback:XMLHttpRequest->XMLHttpRequest->Void):XHR{})
	static function xhr(url:String, mimeType:String, ?callback:XMLHttpRequest->XMLHttpRequest->Void):XHR;
	
	/**
	Creates a request for the text file at the specified url. An optional mime type may be specified as the second argument, such as "text/plain". If a callback is specified, the request is immediately issued with the GET method, and the callback will be invoked asynchronously when the file is loaded or the request fails; the callback is invoked with two arguments: the error, if any, and the response text. The response text is undefined if an error occurs. If no callback is specified, the returned request can be issued using xhr.get or similar, and handled using xhr.on. 
	*/
	@:overload(function(url:String, ?callback:XMLHttpRequest->String->Void):XHR{})
	static function text(url:String, mimeType:String, ?callback:XMLHttpRequest->String->Void):XHR;
	
	/**
	Creates a request for the JSON file at the specified url with the mime type "application/json". If a callback is specified, the request is immediately issued with the GET method, and the callback will be invoked asynchronously when the file is loaded or the request fails; the callback is invoked with two arguments: the error, if any, and the parsed JSON. The parsed JSON is undefined if an error occurs. If no callback is specified, the returned request can be issued using xhr.get or similar, and handled using xhr.on. 
	*/
	@:overload(function(url:String, ?callback:XMLHttpRequest->{}->Void):XHR{})
	static function json(url:String, mimeType:String, ?callback:XMLHttpRequest->{}->Void):XHR;
	
	/**
	Creates a request for the XML file at the specified url. An optional mime type may be specified as the second argument, such as "application/xml". If a callback is specified, the request is immediately issued with the GET method, and the callback will be invoked asynchronously when the file is loaded or the request fails; the callback is invoked with two arguments: the error, if any, and the parsed XML as a document. The parsed XML is undefined if an error occurs. If no callback is specified, the returned request can be issued using xhr.get or similar, and handled using xhr.on. 
	*/
	@:overload(function(url:String, ?callback:XMLHttpRequest->js.html.Document->Void):XHR{})
	static function xml(url:String, mimeType:String, ?callback:XMLHttpRequest->js.html.Document->Void):XHR;
	
	/**
	Creates a request for the HTML file at the specified url with the mime type "text/html". If a callback is specified, the request is immediately issued with the GET method, and the callback will be invoked asynchronously when the file is loaded or the request fails; the callback is invoked with two arguments: the error, if any, and the parsed HTML as a document fragment. The parsed HTML is undefined if an error occurs. If no callback is specified, the returned request can be issued using xhr.get or similar, and handled using xhr.on. 
	*/
	static function html(url:String, ?callback:XMLHttpRequest->js.html.DocumentFragment->Void):XHR;
	
	/**
	Issues an HTTP GET request for the comma-separated values (CSV) file at the specified url. The file contents are assumed to be [RFC4180-compliant](http://tools.ietf.org/html/rfc4180). The mime type of the request will be "text/csv". The request is processed asynchronously, such that this method returns immediately after opening the request. When the CSV data is available, the specified callback will be invoked with the parsed rows as the argument. If an error occurs, the callback function will instead be invoked with null. An optional accessor function may be specified, which is then passed to d3.csv.parse; the accessor may also be specified by using the return request object’s row function. For example: 
	
	```js
	d3.csv("example.csv", function(d) {
	  return {
		year: new Date(+d.Year, 0, 1), // convert "Year" column to Date
		make: d.Make,
		model: d.Model,
		length: +d.Length // convert "Length" column to number
	  };
	}, function(error, rows) {
	  console.log(rows);
	});
	```
	
	See the [unemployment choropleth](http://bl.ocks.org/mbostock/4060606) for an example.
	*/
	//@:overload(function(url:String, ?callback:XMLHttpRequest->Array<{}>->Void):XHRR { } )	
	//static function csv(url:String, accessor:Callb<{}->Int->Dynamic>, ?callback:XMLHttpRequest->Array<Dynamic>->Void):XHRR;
		
	/**
	see csv 
	*/
	//@:overload(function(url:String, ?callback:XMLHttpRequest->Array<{}>->Void):XHRR { } )	
	//static function tsv(url:String, accessor:Callb<{}->Int->Dynamic>, ?callback:XMLHttpRequest->Array<Dynamic>->Void):XHRR;
	
	// -=-=-=-=-=-=- d3.layout (Layouts) -=-=-=-=-=-=-
}