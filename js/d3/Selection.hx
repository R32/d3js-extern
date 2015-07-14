package js.d3;

import js.html.Node;
import js.Lib;
import js.d3.selection.*;
/**
A selection is an array of elements pulled from the current document. D3 uses CSS3 to select elements. For example, you can select by tag (`"div"`), class (`".awesome"`), unique identifier (`"#foo"`), attribute (`"[color=red]"`), or containment (`"parent child"`). Selectors can also be intersected (`".this.that"` for logical AND) or unioned (`".this, .that"` for logical OR). If your browser doesn't support selectors natively, you can include Sizzle before D3 for backwards-compatibility. After selecting elements, you apply operators to them to do stuff. These operators can get or set attributes, styles, properties, HTML and text content.

https://github.com/mbostock/d3/wiki/Selections
*/
@:native("d3.selection") extern class Selection extends Enter<Group> {
	
	/**
	The selector may also be specified as a function that returns an array of elements (or a NodeList), or the empty array if there are no matching elements.

	https://github.com/mbostock/d3/wiki/Selections#subselections
	*/
	@:overload(function(func:Callb<Dynamic->Int->Int->Array<Node>>):Selection{})
	function selectAll(query:String):Selection;

	/**
	If value is specified, sets the attribute with the specified name to the specified value on all selected elements. If value is a constant, then all elements are given the same attribute value;
	
	otherwise, if value is a function, then the function is evaluated for each selected element (in order), being passed the current datum d and the current index i, with the this context as the current DOM element. The function's return value is then used to set each element's attribute. A null value will remove the specified attribute.
	
	```js
	function callback(?data:Dynamic, ?indexInGroup:Int, ?indexByGroup:Int):Null<String>{
		// js.Lib.nativeThis(this) --> HTMLDOM Node
	}
	```
	
	If value is not specified, returns the value of the specified attribute for the first non-null element in the selection. This is generally useful only if you know that the selection contains exactly one element.
	
	The specified name may have a namespace prefix, such as xlink:href, to specify an "href" attribute in the XLink namespace. By default, D3 supports svg, xhtml, xlink, xml, and xmlns namespaces. Additional namespaces can be registered by adding them to `d3.ns.prefix` using dot notation.
	*/
	@:overload(function(name:String):Null<String> { } )
	@:overload(function(name:String, cb:Callb<Dynamic->Int->Int->Primitive>):Selection { } )	
	function attr(name:String, value:Primitive):Selection;
	
	
	/**
	If value is specified, sets whether or not the specified class is associated with the selected elements. If value is a constant and truthy, then all elements are assigned the specified class, if not already assigned; if falsey, then the class is removed from all selected elements, if assigned
	 
	If value is a function, then the function is evaluated for each selected element (in order), being passed the current datum d and the current index i, with the this context as the current DOM element. The function's return value is then used to assign or unassign the specified class on each element.
	 
	If you want to set several classes at once, use an object literal like so: `.classed({'foo': true, 'bar': false})`, or use a space-separated list of class names like so: `.classed('foo bar', true)`.
	
	If value is not specified, returns true if and only if the first non-null element in this selection has the specified class. This is generally useful only if you know the selection contains exactly one element.
	*/
	@:overload(function(name:String):Bool { } )
	@:overload(function(obj:{}):Selection { } )
	@:overload(function(name:String, cb:Callb<Dynamic->Int->Int->Bool>):Selection { } )
	function classed(name:String, value:Bool):Selection;
		

	/**
	If value is not specified, returns the current computed value of the specified style property for the first non-null element in the selection. Note that the computed value may be different than the value that was previously set
	
	if value is function: return value is then used to set each element's style property. A null value will remove the style property
	
	if value is Object: `.style({'stroke': 'black', 'stroke-width': 2})`
	
	An optional `priority` may also be specified, either as `null` or the string `important`
	*/
	@:overload(function(name:String):String { } )
	@:overload(function(obj: { } ):Selection { } )
	@:overload(function(name:String, cb:Callb<Dynamic->Int->Int->Primitive>,?priority:String):Selection { } )
	function style(name:String, value:Primitive, ?priority:String):Selection;
	
	
	/**
	If value is not specified, return the value of the specified property for the first non-null element in the selection.
	
	If value is specified, sets the property with the specified name to the specified value on all selected elements. If value is a constant, then all elements are given the same property value.
	
	if value is a function, then the function is evaluated for each selected element (in order), `function callback(data, indexInGroup, indexByGroup):Dynamic{this->DOM NODE}`,
	
	If value is Object, `.property({'foo': 'bar', 'baz': 'qux'})` 
	
	Some HTML elements have special properties that are not addressable using standard attributes or styles. For example, form text fields have a value string property, and checkboxes have a checked boolean property.You can use the property operator to get or set these properties, or any other addressable field on the underlying element, such as `className`.
	
	一些 HTML 元素有一些不可以通过 attribute 或 styles 获得值的特殊属性. 例如: `input[type=text]` 元素有string类型的 `value`属性, `checkboxes` 有bool类型的 `checked` 的属性. 可以使用 `property` 获得或设置这些属性, 或DOM元素可通过 `.` 访问的字段如 `className`
	*/
	@:overload(function(name:String):Dynamic { } )
	@:overload(function(obj: { } ):Selection { } )
	@:overload(function(name:String, cb:Callb<Dynamic->Int->Int->Dynamic>):Selection { } )
	function property(name:String, value:Dynamic):Selection;

	
	/**
	based on the `textContent` property.  returns the inner text content for the first non-null element in the selection
	*/
	@:overload(function():String { } )
	@:overload(function(func:Callb<Dynamic->Int->Int->String>):Selection { } )
	function text(text:String):Selection;
	
	
	/**
	If value is not specified,  returns the inner HTML content for the first non-null element in the selection

	based on the `innerHTML` property, setting the inner HTML content will replace any existing child elements. Also, you may prefer to use the `append` or `inser`t operators to create HTML content in a data-driven way; this operator is intended for when you want a little bit of HTML, say for rich formatting. A null value will clear the content
	*/
	@:overload(function():Null<String> { } )
	@:overload(function(func:Callb<Dynamic->Int->Int->String>):Selection { } )
	function html(html:Null<String>):Selection;
	
	
	
	/**
	If value is not specified, returns the bound datum for the first non-null element in the selection. This is generally useful only if you know the selection contains exactly one element.

	The return value is then used to set each element's data. A `null` value will delete the bound data.
	
	Gets or sets the bound data for each selected element. Unlike the `selection.data` method, this method does not compute a join (and thus does not compute enter and exit selections). This method is implemented on top of `selection.property`:
	
	```js
	d3.selection.prototype.datum = function(value) {
		return arguments.length < 1
			? this.property("__data__")
			: this.property("__data__", value);
	};
	```
	
	If value is specified, sets the element's bound data to the specified value on all selected elements. If value is a constant, all elements are given the same data. A `null` value will delete the bound data.
	
	if value is a function, then the function is evaluated for each selected element,The function is then used to set each element's data. return A `null` value will delete the bound data.
	
	```
	function func(data:Dynamic, indexInGroup:Int, indexByGroup:Int):Dynamic{
		// js.Lib.nativeThis(this) --> HTMLDOM Node
	} 
	```
	
	This method is useful for accessing HTML5 custom data attributes...
	
	*/
	@:overload(function():Dynamic { } )
	@:overload(function(cb:Dynamic->Int->Int->Dynamic):Selection { } )
	function datum(data:Dynamic):Selection;
	
	
	/**
	If values is not specified, then this method returns the array of data for the first group in the selection. The length of the returned array will match the length of the first group, and the index of each datum in the returned array will match the corresponding index in the selection. If some of the elements in the selection are null, or if they have no associated data, then the corresponding element in the array will be `undefined`. 
	
	Note: the data method cannot be used to clear previously-bound data; use selection.datum instead.
		
	
	Note-cn: 如果未指定 value, 那么将返回相对应的数组数据. 注意: 这个方法不能用于删除数据绑定, 如需删除绑定的数据使用 `.datum(null)`
	
	
	If a key function is specified, a function that return an array of values.  `function func(data:Dynamic, index:Int):Array<Dynamic>` Note: the first param `data` is the `parentNode.__data__`, the second param `index` is the indexByGroup
	
	```js
	var matrix = [
		[11975,  5871, 8916, 2868],	//	indexByGroup = 0
		[ 1951, 10048, 2060, 6171],	//	indexByGroup = 1
		[ 8010, 16145, 8090, 8045],	//	indexByGroup = 2
		[ 1013,   990,  940, 6907]	//	......
	];

	var tr = d3.select("body").append("table").selectAll("tr")
		.data(matrix)
		.enter().append("tr");

	var td = tr.selectAll("td").data(function(d) { return d; })
		.enter().append("td")
		.text(function(d) { return d; });
	```
	
	参照上边示例, 注意: 回调函数的第一个参数为 `parentNode.__data__` , 第二个参数 indexByGroup, 内部 this 指向对应的 Group, 返回值将于设置对应 DOM 元素的 `__data__` 属性
	
	
	Joins the specified array of data with the current selection. The result is the update Selection. When data is assigned to an element, it is stored in the property `__data__` (defined by D3). A key `function key(?d:Dynamic , ?i:Int ):String` may be specified to control how data is joined to elements (this replaces the default by-index behavior). more info about key function: https://github.com/mbostock/d3/wiki/Selections#data
	
	
	将数据和当前Selection挂接( <b>JOIN</b> ). 当数据已经挂接到对应DOM元素时, 值将存储于DOM元素的 `__data__` 属性(由d3定义的)
	
	参数 key,将控制 数据如何与 DOM元素相关联, key函数将被迭代二次: 每次都需要返回一个用于检索的 unique keyValue
	
	  - 第一次, 内部 this 指向 DOM元素, 参数 d 为 `DOM.__data__` , 参数 i 为 DOM元索的 indexInGroup
	  
	  - 第二次, 内部 this 指向 .data() 方法的第一个参数 `value:Array<Dynamic>`, 参数 d 为数组 (`value:Array<Dynamic>`) 中的一个值, i 为 d 的索引
	  
	第一次循环时,会将 `DOMNode.__data__` 中的 的指定(函数返回)的 keyValue 加入一个内置的 Map(map.set(keyValue,DOMNODE)), 
	 
	第二次循环时,检测 Map(map.get(keyValue) == DOMNode) 是否包含 DOMNode, 如果存则更新 `__data__`, 不存在则并压入 enterNodes 后续作再处理. 然而对于已经存在 DOMNODE,它并不会自动排序，因此需要用 .order 或 .sort
	
	对于返回值 SelectionUpdate, 通常情况下, 由于 `__data__` 已经更新, 你需要更新一下数据对应 DOM元素, 如果 `数据 > Selection` 则很可能需要调用 .enter() 然后添加 DOM 元素, 但如果 `数据 < Selection`, 则需要调用 .exit() 来移除多余的 DOM 元素。
	*/
	@:overload(function():Array<Dynamic> { } )
	@:overload(function(func:Callb<Dynamic->Int->Array<Dynamic>>, ?key:Callb<{}->Int->String>):Update { } )
	function data(value:Array<Dynamic>, ?key:Callb<{}->Int->String>):Update;
	
	
	/**
	Filters the selection, returning a new selection that contains only the elements for which the specified selector is true. The selector may be specified either as a function or as a selector string, such as ".foo". As with other operators, the function is passed the current datum d and index i, with the this context as the current DOM element. Filter should only be called on selections with DOM elements bound, e.g. from append or insert. To bind elements to only a subset of the data, call the built-in array filter on the argument to data. Like the built-in function, D3's filter does not preserve the index of the original selection in the returned selection; it returns a copy with elements removed. If you want to preserve the index, use select instead.

	For example, to select every element with an odd index (relative to the zero-based index):
	
	```js
	// function cb(data, indexInGroup, indexByGroup):Bool{ this => DOM Node }
	var odds = selection.select(function(d, i) { return i & 1 ? this : null; });
	```
	
	Or a filter selector (noting that the :nth-child pseudo-class is a one-based index rather than a zero-based index):
	
	```js
	var odds = selection.filter(":nth-child(even)");
	```
	
	Thus, you can use either select or filter to apply operators to a subset of elements.
	
	*/
	@:overload(function(query:String):Selection { } )
	function filter(cb:Callb<Dynamic->Int->Int->Bool>):Selection;
	
	/**
	Sorts the elements in the current selection according to the comparator function, and then re-inserts the document elements to match. Returns the selection. 
	
	example: `.sort(function(a,b ){return a > b ? 1 : -1 })`
	*/
	function sort(?comparator:Dynamic->Dynamic->Int):Selection;
	
	/**
	Re-inserts elements into the document such that the document order matches the selection order. This is equivalent to `.sort()` if the data is already sorted, but much faster. 
	
	根据 `data` 对应将 DOM 元素重插入使 DOM 元素的位置符合 对应 data 的位置.
	*/
	function order():Selection;
	
	
	/**
	If listener is not specified, returns the currently-assigned listener for the specified type.
	
	Adds or removes(set `listener` as `null`) an event listener to each element in the current selection, for the specified type
	
	  - type:  such as "click", "mouseover", or "submit"(Any DOM event type supported by your browser may be used)
	
	  - listener: `function listener(__data__, indexInGroup, indexByGroup){ js.Lib.NativeThis -> DOM Node }` or `null`
	  
	  - capture:  which corresponds to the [W3C useCapture flag](http://www.w3.org/TR/DOM-Level-2-Events/events.html#Events-registration)
	  
	If an event listener was already registered for the same type on the selected element, the existing listener is removed before the new listener is added. To register multiple listeners for the same event type, the type may be followed by an optional namespace, such as "click.foo" and "click.bar". To remove a listener, pass `null` as the listener. To remove all listeners for a particular event type, pass null as the listener, and `.type` as the type, e.g. `selection.on(".foo", null)`
	*/
	@:overload(function(type:String):Callb<Dynamic->Int->Int->Void>{})
	function on(type:String, listener:Null<Callb<Dynamic->Int->Int->Void>>, ?capture:Bool):Selection;
	
	
	/**
	Invokes the specified function for each element in the current selection, the `this` context of the current DOM element, The each operator can be used to process selections recursively, by using `d3.select(this)` within the callback function
	*/
	function each(func:Callb<Dynamic->Int->Int->Void>):Selection;
	
	
	/**
	Removes the elements in the current selection from the current document. Returns the current selection (the same elements that were removed) which are now “off-screen”, detached from the DOM. Note that there is not currently a dedicated API to add removed elements back to the document; however, you can pass a function to selection.append or selection.insert to re-add elements. 
	
	移除当前 Selection 中的 DOM 元素, 被移除的元素将为 `off-screen` 状态. 注意: 目前没有 API 将移除的 DOM 元素添加回去. 但是可以通过 `.append(function(){})` 的形式将它们添加回去
	*/
	function remove():Selection;
	
	
	/**
	Starts a transition for the current selection. Transitions behave much like selections, except operators animate smoothly over time rather than applying instantaneously.
	
	Transitions of the same name are [exclusive per-element](http://bost.ocks.org/mike/transition/). When the new transition starts on a given element, it will interrupt an active transition of the same name on the element, if any. If a name is not specified, the empty name (“”) is used. Note that transitions with a zero delay do not start until the next timer tick, which is typically about 17ms after scheduling.
	*/
	function transition(?name:String):Transition;
	
	/**
	Immediately interrupts the active transition of the specified name on the selected elements, if any. If a name is not specified, the empty name (“”) is used. Does not cancel any scheduled transitions that have not yet started. To cancel scheduled transitions as well, simply create a new zero-delay transition after interrupting the current transition:
	
	```js
	selection
		.interrupt()	// cancel the current transition
		.transition();	// preempt any scheduled transitions
	```
	*/
	function interrupt(?name:String):Selection;
}


