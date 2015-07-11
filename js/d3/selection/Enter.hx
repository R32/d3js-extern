package js.d3.selection;

import js.html.Node;
import haxe.extern.EitherType;

extern class Enter<T> extends JSArray<T>{
	
	/**
	For each element in the current selection, selects the first descendant element that matches the specified selector string. If no element matches the specified selector for the current element, the element at the current index will be null in the returned selection; operators (with the exception of data) automatically skip null elements, thereby preserving the index of the existing selection. If the current element has associated data, this data is inherited by the returned subselection, and automatically bound to the newly selected elements. If multiple elements match the selector, only the first matching element in document traversal order will be selected.

	The selector may also be specified as a function that returns an element, or null if there is no matching element. In this case, the specified selector is invoked in the same manner as other operator functions, being passed the current datum d and index i, with the this context as the current DOM element.
	
	`function callb(data, indexInGroup, indexByGroup):Null<Node>{}`	 
	
	*/
	@:overload(function(func:Callb<Dynamic->Int->Int->Node>):Selection { } )
	function select(query:String):Selection;
	
	
	/**
	Appends a new element with the specified name as the last child of each element in the current selection, returning a new selection containing the appended elements. Each new element inherits the data of the current elements, if any, in the same manner as select for subselections.

	The name may be specified either as a constant string or as a function that returns the DOM element to append. When the name is specified as a string, it may have a namespace prefix of the form "namespace:tag". For example, "svg:text" will create a "text" element in the SVG namespace. By default, D3 supports svg, xhtml, xlink, xml and xmlns namespaces. Additional namespaces can be registered by adding to [d3.ns.prefix](https://github.com/mbostock/d3/wiki/Namespaces#prefix). If no namespace is specified, then the namespace will be inherited from the enclosing element; or, if the name is one of the known prefixes, the corresponding namespace will be used (for example, "svg" implies "svg:svg").
	
	param callback like: `function func(?data:Dynamic, ?indexInGroup:Int, ?indexByGroup:Int):Node{}`
	*/
	@:overload(function(func:Callb<Dynamic->Int->Int->Node>):Selection { } )
	function append(name:String):Selection;
	
	
	/**
	Inserts a new element with the specified name before the element matching the specified before selector, for each element in the current selection, returning a new selection containing the inserted elements. If the before selector does not match any elements, then the new element will be the last child as with append. Each new element inherits the data of the current elements (if any), in the same manner as select for subselections.

	The name may be specified either as a constant string or as a function that returns the DOM element to append. When the name is specified as a string, it may have a namespace prefix of the form "namespace:tag". For example, "svg:text" will create a "text" element in the SVG namespace. By default, D3 supports svg, xhtml, xlink, xml and xmlns namespaces. Additional namespaces can be registered by adding to d3.ns.prefix. If no namespace is specified, then the namespace will be inherited from the enclosing element; or, if the name is one of the known prefixes, the corresponding namespace will be used (for example, "svg" implies "svg:svg").

	Likewise, the before selector may be specified as a selector string or a function which returns a DOM element. For instance, `insert("div", ":first-child")` will prepend child div nodes to the current selection. For enter selections, the before selector may be omitted, in which case entering elements will be inserted immediately before the next following sibling in the update selection, if any. This allows you to insert elements into the DOM in an order consistent with bound data. Note, however, the slower selection.order may still be required if updating elements change order.
	*/
	function insert(name:EitherType<String,Callb<Dynamic->Int->Int->Node>>, ?before:EitherType<String,Callb<Dynamic->Int->Int->Node>>):Selection;
	

	/**
	Returns true if the current selection is empty; a selection is empty if it contains no elements or only null elements 
	*/
	function empty():Bool;
	
	
	/**
	return first non-null element 
	*/
	function node():Null<js.html.Node>;
	
	
	/**
	Invokes the specified function once, passing in the current selection along with any optional arguments
	
	`.call(foo, 1,2,3) => foo(Selection,1,2,3)` 
	*/
	function call(func:Callb<Selection->Void>, args:haxe.extern.Rest<Dynamic>):Selection;
	
	/**
	Returns the total number of elements in the current selection. 
	*/
	function size():Int;
}	