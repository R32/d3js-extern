package js.d3.selection;

extern class Update extends Selection {
	/**
	Returns the enter selection: placeholder nodes for each data element for which no corresponding existing DOM element was found in the current selection. This method is only defined on the update selection, which is returned by the data operator. In addition, the enter selection only defines the append, insert, select and call operators; you must use these operators to instantiate the entering elements before modifying any content. Enter selections also support empty and size.

	As a simple example, consider the case where the existing selection is empty, and we wish to create new nodes to match our data:
	
	```js
	d3.select("body").selectAll("div")
		.data([4, 8, 15, 16, 23, 42])
		.enter().append("div")
		.text(function(d) { return d; });
	```
	
	Assuming that the body is initially empty, the above code will create six new DIV elements, append them to the body in order, and assign their text content as the associated (string-coerced) number:
	
	```xml
	<div>4</div>
	<div>8</div>
	<div>15</div>
	<div>16</div>
	<div>23</div>
	<div>42</div>
	```
	
	Another way to think about the entering placeholder nodes is that they are pointers to the parent node (in this example, the document body); however, they only support `append` and `insert`. Once elements have been inserted, their indices will reflect the new positions and not necessarily start from zero or be continuous.
	
	The enter selection <b>merges into the update selection</b> when you append or insert. Rather than applying the same operators to the enter and update selections separately, you can now apply them only once to the update selection after entering the nodes. If you find yourself removing an entire selection's elements only to reinsert most of them, do this instead. For example:
	
	```js
	var update_sel = svg.selectAll("circle").data(data)
	update_sel.attr(operate on old elements only) 
	update_sel.enter().append("circle").attr(operate on new elements only)
	update_sel.attr(operate on old and new elements)
	update_sel.exit().remove(complete the enter-update-exit pattern)
	```
	
	zh_CN: 为数据没有相应的 DOM 元素(当 data.length > selection.length)创建占位符. 
	*/
	function enter():Enter<{}>;		// {__data__:Dynamic}
	
	/**
	Returns the exit selection: existing DOM elements in the current selection for which no new data element was found. This method is only defined on the update selection, which is returned by the data operator. The exit selection defines all the normal operators, though typically the main one you'll want to use is remove; the other operators exist primarily so you can define an exiting transition as desired. Note that the exit operator merely returns a reference to the exit selection, and it is up to you to remove the new nodes.
	
	As a simple example, consider updating the six DIV elements created in the above example for the enter operator. Here we bind those elements to a new array of data with some new and some old:
	
	```js
	var div = d3.select("body").selectAll("div")
		.data([1, 2, 4, 8, 16, 32], function(d) { return d; });
	```
	
	Now `div` —the result of the data operator—refers to the updating selection. Since we specified a key function using the identity function, and the new data array contains the numbers `[4, 8, 16]` which also exist in the old data array, this updating selection contains three DIV elements. Let's say we leave those elements as-is. We can instantiate and add the new elements `[1, 2, 32]` using the enter selection:
	
	```js
	div.enter().append("div")
		.text(function(d) { return d; });
	```
	
	Likewise, we can remove the exiting elements `[15, 23, 42]`:
	
	```js
	div.exit().remove();
	```
	
	If you want the document traversal order to match the selection data order, you can use `sort` or `order`.
	
	zh-CN: 返回一个没有匹配到数据 的 DOM 元素(当 data.length < selection.length)的 Selection
	*/
	function exit():Selection;
}