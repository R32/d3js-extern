package js.d3;

import js.d3.FlxEase;

/**
A transition is a special type of selection where the operators apply smoothly over time rather than instantaneously. You derive a transition from a selection using the transition operator. While transitions generally support the same operators as selections (such as attr and style), not all operators are supported; for example, you must append elements before a transition starts. A remove operator is provided for convenient removal of elements when the transition ends.

Transitions may have per-element delays and durations, computed using functions of data similar to other operators. This makes it easy to stagger a transition for different elements, either based on data or index. For example, you can sort elements and then stagger the transition for better perception of element reordering during the transition. For more details on these techniques, see "Animated Transitions in Statistical Data Graphics" by Heer & Robertson.

D3 has many built-in interpolators to simplify the transitioning of arbitrary values. For instance, you can transition from the font string "500 12px sans-serif" to "300 42px sans-serif", and D3 will find the numbers embedded within the string, interpolating both font size and weight automatically. You can even interpolate arbitrary nested objects and arrays or SVG path data. D3 allows custom interpolators should you find the built-in ones insufficient, using the attrTween and styleTween operators. D3's interpolators provide the basis for scales and can be used outside of transitions; an interpolator is a function that maps a parametric value t in the domain [0,1] to a color, number or arbitrary value.

Multiple transitions may operate on any selection sequentially or in parallel. Sequential transitions on a selection are enabled by chaining transitions using transition.transition. Parallel transitions on a selection are enabled by assigning each parallel transition a unique name. Only one transition with a given name may be active on a given element at a given time. However, multiple transitions with the same name may be scheduled on the same element; provided they are staggered in time, each transition will run in sequence. If a newer transition runs on a given element, it implicitly cancels any older transitions with the same name, including any that were scheduled but not yet run. This allows new transitions, such as those in response to a new user event, to supersede older transitions even if those older transitions are staged or have staggered delays. Multi-stage transitions (transitions that are created during the "end" event of an earlier transition) are considered the same "age" as the original transition; internally this is tracked by monotonically-increasing unique IDs which are inherited when multi-stage transitions are created. To interrupt an in-progress transition, use selection.interrupt. 

zh-CN: Transition 是一个特殊的 Selection.
*/
extern class Transition extends JSArray<JSArray<js.html.Node>>{
	
	/**
	Specifies the transition delay in milliseconds. If delay is a constant, then all elements are given the same delay; otherwise, if delay is a function, then the function is evaluated for each selected element (in order), being passed the current datum d and the current index i, with the this context as the current DOM element. The function's return value is then used to set each element's delay. The default delay is 0. If delay is not specified, returns the delay bound to the first non-null element in the transition.

	Setting the delay to be a multiple of the index i is a convenient way to stagger transitions for elements. For example, if you used a fixed duration of duration, and have n elements in the current selection, you can stagger the transition over 2 * duration by saying: 
	
	```js
	// cb(data, i, j):delay{ this -> DOM Node}
	.delay(function(d, i) { return i / n * duration; })
	```
	
	You may also compute the delay as a function of the data, thereby creating a data-driven animation.
	
	Note that a delay is always relative to the first transition in a chain.
	
	zh-CN: 像 Selection 一样,如果未指定 参数,则返回第一个非 null 元素的 delay 值.
	*/
	@:overload(function():Float{})
	@:overload(function(cb:Callb<Dynamic->Int->Int->Float>):Transition {} )	
	function delay(dylay:Float):Transition;
	
	/**
	Specifies per-element duration in milliseconds. If duration is a constant, then all elements are given the same duration; otherwise, if duration is a function, then the function is evaluated for each selected element (in order), being passed the current datum d and the current index i, with the this context as the current DOM element. The function's return value is then used to set each element's duration. The default duration is 250ms. If duration is not specified, returns the duration bound to the first non-null element in the transition. 
	*/
	@:overload(function():Float{})
	@:overload(function(cb:Callb<Dynamic->Int->Int->Float>):Transition{})
	function duration(duration:Float):Transition;
	
	/**
	Specifies the transition easing function. If value is a function, it is used to ease the current parametric timing value t, which is typically in the range [0,1]. (At the end of a transition, t may be slightly greater than 1.) Otherwise, value is assumed to be a string and the arguments are passed to the d3.ease method to generate an easing function. 
	
	The default easing function is "cubic-in-out". Note that it is not possible to customize the easing function per-element or per-attribute; however, if you use the "linear" easing function, you can apply custom easing inside your interpolator using attrTween or styleTween. If ease is not specified, returns the easing function bound to the first non-null element in the transition. 
	
	zh-CN: 无法通过 easy 为每个元素设定不同的 easy 函数, 但是可以通过 attrTween 或 styleTween 的形式实现
	*/
	@:overload(function():EaseFunction{})
	@:overload(function(ease:EaseType,?rest:haxe.extern.Rest<Float>):Transition{})
	function ease(value:EaseFunction):Transition;
	

	//				Operating on Transitions
	
	
	
	/**
	Transitions the value of the attribute with the specified name to the specified value. The starting value of the transition is the current attribute value(be sure to set an initial value beforehand if you don't want bad surprises), and the ending value is the specified value. If value is a constant, then all elements are transitioned to the same attribute value; otherwise, if value is a function, then the function is evaluated for each selected element (in order), being passed the current datum d and the current index i, with the this context as the current DOM element. The function's return value is then used to transition each element's attribute. ~~Null values are not supported because the interpolator would be undefined; if you want to remove the attribute after the transition finishes, use remove~~.
	
	An interpolator is selected automatically based on the ending value. If the ending value is a number, the starting value is coerced to a number and interpolateNumber is used. If the ending value is a string, a check is performed to see if the string represents a color of the form /^(#|rgb\(|hsl\()/, or one of the CSS named colors; if so, the starting value is coerced to an RGB color and interpolateRgb is used. Otherwise, interpolateString is used, which interpolates numbers embedded within strings. 
	
	`function callback(data, i, j):Null<String>`
	
	zh-CN: 实际上如果值为 null, 将会移除属性.
	*/
	@:overload(function(name:String, cb:Callb<Dynamic->Int->Int->Primitive>):Transition{ } )	
	function attr(name:String, value:Primitive):Transition;
	
	/**
	Transitions the value of the attribute with the specified name according to the specified tween function. The starting and ending value of the transition are determined by tween; the tween function is invoked when the transition starts on each element, being passed the current datum d, the current index i and the current attribute value a, with the this context as the current DOM element. The return value of tween must be an interpolator: a function that maps a parametric value t in the domain [0,1] to a color, number or arbitrary value.

	For example, the attr operator is built on top of the attrTween operator. The tween function used by the attr operator depends on whether the end value is a function or a constant. If the end value is a function: 
	
	```js
	function tween(d, i, a) {
		return d3.interpolate(a, String(value.call(this, d, i)));
	}
	
	// Otherwise, if the end value is a constant:
	
	function tween(data, i, curValue):InterpFunction{
		return d3.interpolate(curValue, String(newValue));
	}
	
	The attrTween operator is used when you need a custom interpolator, such as one that understands the semantics of SVG path data. One common technique is dataspace interpolation, where interpolateObject is used to interpolate two data values, and the result of this interpolation is then used (say, with a shape) to compute the new attribute value. Use the attr operator for the simpler common case where an interpolator can be automatically derived from the current attribute value to the desired end value.
	
	zh-CN: 通过自定义 interpolate 更改 attr
	```
	*/
	function attrTween(name:String, tween:Dynamic->Int->String->InterpFunction<Dynamic>):Transition;
	
	
	/**
	Transitions the value of the CSS style property with the specified name to the specified value. An optional priority may also be specified, either as null or the string "important" (without the exclamation point). The starting value of the transition is the current computed style property value, and the ending value is the specified value. If value is a constant, then all elements are transitioned to the same style property value; otherwise, if value is a function, then the function is evaluated for each selected element (in order), being passed the current datum d and the current index i, with the this context as the current DOM element. The function's return value is then used to transition each element's style property. Null values are not supported because the interpolator would be undefined; if you want to remove the style property after the transition finishes, listen to the end event.

	An interpolator is selected automatically based on the ending value. If the ending value is a number, the starting value is coerced to a number and interpolateNumber is used. If the ending value is a string, a check is performed to see if the string represents a color of the form /^(#|rgb\(|hsl\()/, or one of the CSS named colors; if so, the starting value is coerced to an RGB color and interpolateRgb is used. Otherwise, interpolateString is used, which interpolates numbers embedded within strings. 
	
	Note that the computed starting value may be different than the value that was previously set, particularly if the style property was set using a shorthand property (such as the "font" style, which is shorthand for "font-size", "font-face", etc.). Moreover, computed dimensions such as "font-size" and "line-height" are always in pixels, so you should specify the ending value in pixels too if appropriate.
	*/
	@:overload(function(obj: { } ):Transition { } )
	@:overload(function(name:String, cb:Callb<Dynamic->Int->Int->Primitive>,?priority:String):Transition { } )
	function style(name:String, value:Primitive, ?priority:String):Transition;
	
	/**
	see attrTween
	*/
	function styleTween(name:String, tween:Dynamic->Int->String->InterpFunction<Dynamic>, ?priority:String):Transition;
	
	/**
	The text operator is based on the textContent property; setting the text content will replace any existing child elements.

	Set the text content to the specified value on all selected elements when the transition starts. If value is a constant, then all elements are given the same text content; otherwise, if value is a function, then the function is evaluated for each selected element (in order), being passed the current datum d and the current index i, with the this context as the current DOM element. The function's return value is then used to set each element's text content. A null value will clear the content. 
	*/
	@:overload(function(callb:Callb<Dynamic->Int->Int->Primitive>):Transition{})
	function text(value:Primitive):Transition;
	
	/**
	Registers a custom tween for the specified name. When the transition starts, the specified factory function will be invoked for each selected element in the transition, being passed that element's data (d) and index (i) as arguments, with the element as the context (this). The factory should return the tween function to be called over the course of the transition. The tween function is then called repeatedly, being passed the current normalized time t in [0, 1]. If the factory returns null, then the tween is not run on the selected element.

	The tween method is used internally to implement `attr` and `style` tweens, and can be used to interpolate other document content. For example, to interpolate text content from 0 to 100:

	```js
	selection.transition().tween("text", function() {
		var i = d3.interpolateRound(0, 100);
		return function(t) {
			this.textContent = i(t);
		};
	});
	
	// function factory(data, i):Void{}
	```
	
	Tweens are often written using closures to capture state created when the transition starts. In the example above, the interpolator i is initialized when the transition starts, and then used subsequently over the course of the transition. (Though note that in the above example, the starting value of the transition is hard-coded to zero, whereas more commonly the starting value of the transition is based on the current state in the DOM.) 
	*/
	function tween(name:String, factory:Callb<Dynamic->Int->Void>):Transition;
	
	/**
	Remove the selected elements at the end of a transition. If a newer transition is scheduled on any of the selected elements, these elements will not be removed; however, the "end" event will still be dispatched. 
	
	zh-CN: 在动画结束后删除选中的DOM元素, 如果有新动画,那么元素将不会被删除, "end" 事件也不会触发.
	*/
	function remove():Transition;
		
	// --- Subtransitions
	
	/**
	For each element in the current transition, selects the first descendant element that matches the specified selector string. If no element matches the specified selector for the current element, the element at the current index will be null in the returned selection; operators (with the exception of data) automatically skip null elements, thereby preserving the index of the existing selection. If the current element has associated data, this data is inherited by the returned subselection, and automatically bound to the newly selected elements. If multiple elements match the selector, only the first matching element in document traversal order will be selected.

	This method is approximately equivalent to:

	```js
	selection.select(selector).transition()
	```
	
	where selection is the current transition's underlying selection. In addition, the returned new transition inherits easing, duration and delay from the current transition. 
	*/
	@:overload(function(func:Callb<Dynamic->Int->Int->js.html.Node>):Transition { } )
	function select(query:String):Transition;
	
	/**
	This method is approximately equivalent to: `selection.selectAll(selector).transition()`
	*/
	@:overload(function(func:Callb<Dynamic->Int->Int->Array<js.html.Node>>):Transition{})
	function selectAll(query:String):Transition;
		
	/**
	Filters the transition, returning a new transition that contains only the elements for which the specified selector is true. The selector may be specified either as a function or as a selector string, such as ".foo". As with other operators, the function is passed the current datum d and index i, with the this context as the current DOM element. Like the built-in array filter method, the returned selection does not preserve the index of the original selection; it returns a copy with elements removed. If you want to preserve the index, use select instead. For example, to select every other element:
	
	```js
	var odds = transition.select(function(d, i) { return i & 1 ? this : null; });
	
	// Equivalently, using a filter function:
	
	odds = transition.filter(function(d, i) { return i & 1; });
	
	// Or a filter selector:
	odds = transition.filter(":nth-child(odd)");
	```
	
	Thus, you can use either select or filter to apply tweens to a subset of elements.
	*/
	@:overload(function(query:String):Transition { } )
	function filter(cb:Callb<Dynamic->Int->Int->Primitive>):Transition;
	
	/**
	Creates a new transition on the same selected elements that starts when this transition ends. The new transition inherits a delay equal to this transition's delay + duration to control this timing. The new transition also inherits this transition’s name, duration, and easing. This can be used to define chained transitions without needing to listen for "end" events.
	
	zh-CN: 在当前 selection 开始一个新 transition,在当前 transition 结束开始. 新的 transition 将继承上个的属性值. 这个方法用于创建链式动画,而无需监听 “end” 事件.
	*/
	function transition():Transition;
	
	
	/**
	If type is specified, adds a listener for transition events, supporting "start", "end" and "interrupt" events. The listener will be invoked for each individual element in the transition.

	The start event is invoked during the first asynchronous callback (tick) of the transition, before any tweens are invoked. For transitions with zero delay, this is typically about 17ms after the transition is scheduled. State events are useful for triggering instantaneous changes to each element, such as changing attributes that cannot be interpolated.

	The end event is invoked during the last asynchronous callback (tick) after the transition duration and delay expires, after all tweens are invoked with t=1. Note that if the transition is superseded by a later-scheduled transition on a given element, no end event will be dispatched for that element; interrupted transitions do not trigger end events. For example, transition.remove schedules each element to be removed when the transition ends, but if the transition is interrupted, the element will not be removed. End events can be used as an alternative to transition.transition to create chained transitions by selecting the current element, this, and deriving a new transition; however, this can lead to clock drift over time and thus transition.transition should be preferred.

	The interrupt event is invoked if an active transition is interrupted by another transition of the same name on the same element. The interrupt event is dispatched on the interrupted transition immediately prior to the start event on the interrupting transition. Note that if a transition is cancelled before it starts (such as when a later-scheduled transition starts before a delayed transition), no interrupt event is dispatched.

	If type is not specified, behaves similarly to selection.each: immediately invokes the specified function for each element in the current transition, passing in the current datum d and index i, with the this context of the current DOM element. Any transitions created within the scope of transition.each will inherit transition parameters from the parent transition, including id, delay, duration and easing. Thus, transitions created within a transition.each will not interrupt the parent transition, similar to subtransitions.

	The transition.each method can be used to chain transitions and apply shared timing across a set of transitions. For example:

	```js
	d3.transition()
		.duration(750)
		.ease("linear")
		.each(function() {
			d3.selectAll(".foo").transition()
			.style("opacity", 0)
			.remove();
		})
		.transition()
		.each(function() {
			d3.selectAll(".bar").transition()
			.style("opacity", 0)
			.remove();
    });
	```
	By using d3.select(this) within transition.each, you can even inherit staggered delay across a set of selected elements. This technique is used by the Axis component to support automatic transitions.

	See also the [Exit, Update, Enter](http://bl.ocks.org/mbostock/5779690) example.
	
	zh-CN: 在 each 遍历中(无type参数)通过使用 `d3.select(this)` 或类似方法可创建 inherit 的 transition, 用于 `d3.transition()`
	*/
	@:overload(function (listener:Callb<Dynamic->Int->Int->Void>):Transition{})
	function each(type:EachType, listener:Callb<Dynamic->Int->Int->Void>):Transition;
	
	/**
	see selection.Enter::call 
	*/
	function call(func:Callb<Transition->Void>, args:haxe.extern.Rest<Dynamic>):Transition;
	
	function node():Null<js.html.Node>;
	
	function empty():Bool;
	
	function size():Int;
}


typedef InterpFunction<T> = Float->T;

/**
`function<T>(a:<T>, b<T>): InterpFunction<T>`
*/
typedef Interpolator<T> = T->T->InterpFunction<T>;


/**
for transition.each
*/
@:enum abstract EachType(String) to String{
	
	var START = "start";
	
	var END = "end";
	
	var INTERRUPT = "interrupt";
}