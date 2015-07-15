package js.d3;

import haxe.Constraints.Function;

/**
D3’s behaviors and higher level components, such as the brush, use d3.dispatch to broadcast custom events.

For visualizations with coordinated views, d3.dispatch provides a convenient lightweight mechanism for loosely-coupled components. Organizing your code with d3.dispatch can assist with separation of concerns and make your code easier to maintain.
*/
extern class Dispatch implements Dynamic<Function>{

	
	/**
	Adds or removes an event listener for the specified type. The type is a string event type name, such as "start" or "end". The specified listener is invoked with the context and arguments determined by the caller; see dispatch.

	If an event listener was already registered for the same type, the existing listener is removed before the new listener is added. To register multiple listeners for the same event type, the type may be followed by an optional namespace, such as "click.foo" and "click.bar". 

	Likewise, you can remove all registered listeners for a given namespace by saying `dispatch.on(".foo", null)`. 
	*/
	@:overload(function(type:String):Function{})
	function on(type:String, listener:Null<Function>):Dispatch;
	
	
	/**
	The type method (such as dispatch.start in the above example) notifies each registered listener, passing the listener the specified arguments. The this context will be used as the context of the registered listeners. For example, to invoke all registered listeners with the context foo and the argument bar, say dispatch.call( foo, bar ). Thus, you can pass whatever arguments you want to the listeners; most commonly, you might create an object that represents the event, or pass along the current datum ( d ) and index ( i ). You can also control the "this" context of the listeners using call or apply.

	For example, if you wanted a native "click" event to your "custom" event, while preserving the context and arguments, you could say:

	```js
	selection.on("click", function(d, i) {
	  dispatch.custom.apply(this, arguments);
	});
	```
	zh-CN: 调用自定义的方法
	*/
	//function type(arguments:haxe.extern.Rest<Dynamic>):Dispatch;
}