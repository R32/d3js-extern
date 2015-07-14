package js.d3;

import js.d3.behavior.Drag;
import js.d3.behavior.Zoom;

/**
Behaviors encapsulate a complex set of low-level DOM interactions (i.e. user gestures that vary between input methods) into a higher-level set of custom events (see d3.dispatch). Behaviors often allow some additional configuration by the user. D3 includes two built-in behaviors: 

 - Drag — tracks mouse or multitouch movement(s) relative to an origin

 - Zoom — emits zoom and pan events in response to common input idioms
 
Behaviors are typically functions which you can apply to a selection using its call operator. For example, you can create and apply a behavior to a selection like this:

```js
selection.call(d3.behavior.drag().on('dragstart', function (d) {
  console.log("Started moving item with data:", d);
}));
```

Note carefully the nesting: the 'dragstart' event is registered on the `d3.behavior.drag()` instance, not on the selection! It is this same instance — which is itself also a function — that gets called on the selection. This call allows the behavior to do its own internal setup on the selection.
*/
extern class Behavior {
	/**
	Constructs a new drag behavior. Once constructed, you can apply the drag behavior to selected elements using selection.call:
	
	```js
	var drag = d3.behavior.drag();
	selection.call(drag);		// Note: in haxe use .call(drag.selfCall)
	```
	
	All registered listeners use the “drag” namespace, so to subsequently remove the behavior:
	
	```js
	selection.on(".drag", null);
	```
	
	zh-CN: 移除 drag 时注意不要忘了小数点, 因为这个 drag 并不是源生的 drag 事件.
	*/
	function drag():Drag;	
	function zoom():Zoom;	
}