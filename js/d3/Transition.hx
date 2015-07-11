package js.d3;

import js.d3.FlxEase;

/**
A transition is a special type of selection where the operators apply smoothly over time rather than instantaneously. You derive a transition from a selection using the transition operator. While transitions generally support the same operators as selections (such as attr and style), not all operators are supported; for example, you must append elements before a transition starts. A remove operator is provided for convenient removal of elements when the transition ends.

Transitions may have per-element delays and durations, computed using functions of data similar to other operators. This makes it easy to stagger a transition for different elements, either based on data or index. For example, you can sort elements and then stagger the transition for better perception of element reordering during the transition. For more details on these techniques, see "Animated Transitions in Statistical Data Graphics" by Heer & Robertson.

D3 has many built-in interpolators to simplify the transitioning of arbitrary values. For instance, you can transition from the font string "500 12px sans-serif" to "300 42px sans-serif", and D3 will find the numbers embedded within the string, interpolating both font size and weight automatically. You can even interpolate arbitrary nested objects and arrays or SVG path data. D3 allows custom interpolators should you find the built-in ones insufficient, using the attrTween and styleTween operators. D3's interpolators provide the basis for scales and can be used outside of transitions; an interpolator is a function that maps a parametric value t in the domain [0,1] to a color, number or arbitrary value.

Multiple transitions may operate on any selection sequentially or in parallel. Sequential transitions on a selection are enabled by chaining transitions using transition.transition. Parallel transitions on a selection are enabled by assigning each parallel transition a unique name. Only one transition with a given name may be active on a given element at a given time. However, multiple transitions with the same name may be scheduled on the same element; provided they are staggered in time, each transition will run in sequence. If a newer transition runs on a given element, it implicitly cancels any older transitions with the same name, including any that were scheduled but not yet run. This allows new transitions, such as those in response to a new user event, to supersede older transitions even if those older transitions are staged or have staggered delays. Multi-stage transitions (transitions that are created during the "end" event of an earlier transition) are considered the same "age" as the original transition; internally this is tracked by monotonically-increasing unique IDs which are inherited when multi-stage transitions are created. To interrupt an in-progress transition, use selection.interrupt. 
*/
extern class Transition extends JSArray<JSArray<js.html.Node>>{
	
	/**
	Specifies the transition delay in milliseconds. If delay is a constant, then all elements are given the same delay; otherwise, if delay is a function, then the function is evaluated for each selected element (in order), being passed the current datum d and the current index i, with the this context as the current DOM element. The function's return value is then used to set each element's delay. The default delay is 0. If delay is not specified, returns the delay bound to the first non-null element in the transition.

	Setting the delay to be a multiple of the index i is a convenient way to stagger transitions for elements. For example, if you used a fixed duration of duration, and have n elements in the current selection, you can stagger the transition over 2 * duration by saying: 
	
	```js
	// cb(data, indexInGroup, indexByGroup):delay{ this -> DOM Node}
	.delay(function(d, i) { return i / n * duration; })
	```
	
	You may also compute the delay as a function of the data, thereby creating a data-driven animation.
	
	Note that a delay is always relative to the first transition in a chain.
	*/
	@:overload(function(cb:Callb<Dynamic->Int->Int->Int>):Transition{})
	function delay(dylay:Int = 0):Transition;
	
	/**
	Specifies per-element duration in milliseconds. If duration is a constant, then all elements are given the same duration; otherwise, if duration is a function, then the function is evaluated for each selected element (in order), being passed the current datum d and the current index i, with the this context as the current DOM element. The function's return value is then used to set each element's duration. The default duration is 250ms. If duration is not specified, returns the duration bound to the first non-null element in the transition. 
	*/
	@:overload(function(cb:Callb<Dynamic->Int->Int->Int>):Transition{})
	function duration(duration:Int = 250):Transition;
	
	/**
	Specifies the transition easing function. If value is a function, it is used to ease the current parametric timing value t, which is typically in the range [0,1]. (At the end of a transition, t may be slightly greater than 1.) Otherwise, value is assumed to be a string and the arguments are passed to the d3.ease method to generate an easing function. 
	
	The default easing function is "cubic-in-out". Note that it is not possible to customize the easing function per-element or per-attribute; however, if you use the "linear" easing function, you can apply custom easing inside your interpolator using attrTween or styleTween. If ease is not specified, returns the easing function bound to the first non-null element in the transition. 
	*/
	@:overload(function(ease:EaseType,?rest:haxe.extern.Rest<Float>):Transition{})
	function ease(value:EaseFunction):Transition;
	
	//function tween
	//				Operating on Transitions
	
	//@:overload(function(obj: { } ):Transition { } )
	//@:overload(function(name:String, cb:Callb<Dynamic->Int->Int->Null<String>>,?priority:String):Transition { } )
	//function style(name:String, value:Null<String>, ?priority:String):Transition;
	
	
	/**
	Transitions the value of the attribute with the specified name to the specified value. The starting value of the transition is the current attribute value(be sure to set an initial value beforehand if you don't want bad surprises), and the ending value is the specified value. If value is a constant, then all elements are transitioned to the same attribute value; otherwise, if value is a function, then the function is evaluated for each selected element (in order), being passed the current datum d and the current index i, with the this context as the current DOM element. The function's return value is then used to transition each element's attribute. ~~Null values are not supported because the interpolator would be undefined; if you want to remove the attribute after the transition finishes, use remove~~.
	
	An interpolator is selected automatically based on the ending value. If the ending value is a number, the starting value is coerced to a number and interpolateNumber is used. If the ending value is a string, a check is performed to see if the string represents a color of the form /^(#|rgb\(|hsl\()/, or one of the CSS named colors; if so, the starting value is coerced to an RGB color and interpolateRgb is used. Otherwise, interpolateString is used, which interpolates numbers embedded within strings. 
	
	`function callback(data, indexInGroup, indexByGroup):Null<String>`
	*/
	@:overload(function(name:String, cb:Callb<Dynamic->Int->Int->Null<String>>):Transition{ } )	
	function attr(name:String, value:Null<String>):Transition;
	
	/**
	Transitions the value of the attribute with the specified name according to the specified tween function. The starting and ending value of the transition are determined by tween; the tween function is invoked when the transition starts on each element, being passed the current datum d, the current index i and the current attribute value a, with the this context as the current DOM element. The return value of tween must be an interpolator: a function that maps a parametric value t in the domain [0,1] to a color, number or arbitrary value.

	For example, the attr operator is built on top of the attrTween operator. The tween function used by the attr operator depends on whether the end value is a function or a constant. If the end value is a function: 
	
	```js
	function tween(d, i, a) {
		return d3.interpolate(a, String(value.call(this, d, i)));
	}
	
	// Otherwise, if the end value is a constant:
	
	function tween(data, indexInGroup, curValue):InterpFunction{
		return d3.interpolate(curValue, String(newValue));
	}
	
	The attrTween operator is used when you need a custom interpolator, such as one that understands the semantics of SVG path data. One common technique is dataspace interpolation, where interpolateObject is used to interpolate two data values, and the result of this interpolation is then used (say, with a shape) to compute the new attribute value. Use the attr operator for the simpler common case where an interpolator can be automatically derived from the current attribute value to the desired end value.
	```
	*/
	function attrTween(name:String, tween:Dynamic->Int->String->InterpFunction<Dynamic>):Transition;
	
	
	// TODO: continue.
}


typedef InterpFunction<T> = Float->T;

/**
`function<T>(a:<T>, b<T>): InterpFunction<T>`
*/
typedef Interpolator<T> = T->T->InterpFunction<T>;