package js.d3;


extern class Set{
	
	/**
	Returns true if and only if this set has an entry for the specified value string. 
	*/
	function has(val:String):Bool;
	
	/**
	Returns true if and only if this set has an entry for the specified value string. 
	*/
	function add(val:String):String;
	
	/**
	If the set contains the specified value string, removes it and returns true. Otherwise, this method does nothing and returns false. 
	*/
	function remove(val:String):Bool;
	
	/**
	Returns an array of the string values in this set. The order of the returned values is arbitrary. Can be used as a convenient way of computing the unique values for a set of strings. For example: 
	
	```js
	d3.set(["foo", "bar", "foo", "baz"]).values(); // "foo", "bar", "baz"
	```
	*/
	function values():Array<String>;
	
	/**
	Calls the specified function for each value in this set, passing the value as an argument. The this context of the function is this set. Returns `undefined`. The iteration order is arbitrary. 
	*/
	function forEach(func:String->Void):Void;
	
	/**
	Returns true if and only if this set has zero values.
	*/
	function empty():Bool;
	
	/**
	Returns the number of values in this set. 
	*/
	function size():Int;
}