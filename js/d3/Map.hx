package js.d3;

/**
While it is tempting to use bare objects as maps in JavaScript, this can lead to unexpected behavior when built-in property names are used as keys. For example, if you try to set object["__proto__"] = 42, it probably won't do what you expect. The same is true if you attempt to query whether a given key is defined in the map; "hasOwnProperty" in object returns true because your bare object inherits the hasOwnProperty method from the Object prototype. To avoid these problems, ES6 proposes [simple maps and sets](http://wiki.ecmascript.org/doku.php?id=harmony:simple_maps_and_sets); until modern browsers support these collections, you can use d3.map instead.

Note: unlike the proposed ES6 map, d3.map still uses string-coercion for keys rather than strict equality. 
*/
extern class Map{
	
	/**
	Returns true if and only if this map has an entry for the specified key string. Note: the value may be null or undefined. 
	*/
	function has(key:String):Bool;
	
	/**
	Returns the value for the specified key string. If the map does not have an entry for the specified key, returns undefined. 
	*/
	function get(key:String):Dynamic;
	
	/**
	Sets the value for the specified key string; returns the new value. If the map previously had an entry for the same key string, the old entry is replaced with the new value.
	*/
	function set(key:String, value:Dynamic):Dynamic;
	
	/**
	If the map has an entry for the specified key string, removes the entry and returns true. Otherwise, this method does nothing and returns false. 
	*/
	function remove(key:String):Bool;
	
	/**
	Returns an array of string keys for every entry in this map. The order of the returned keys is arbitrary. 
	*/
	function keys(key:String):Array<String>;
	
	/**
	Returns an array of values for every entry in this map. The order of the returned values is arbitrary. 
	*/
	function values():Array<Dynamic>;
	
	/**
	Returns an array of key-value objects for each entry in this map. The order of the returned entries is arbitrary. Each entry’s key is a string, but the value has arbitrary type. 
	*/
	function entries():Array<{}>;
	
	/**
	Calls the specified function for each entry in this map, passing the entry's key and value as two arguments. The this context of the function is this map. Returns undefined. The iteration order is arbitrary.
	
	`func(key,value):Void{ this==map }`
	*/
	function forEach(func:Callb<String->Dynamic->Void>):Void;
	
	/**
	Returns true if and only if this map has zero entries.
	*/
	function empty():Bool;
	
	/**
	Returns the number of entries in this map. 
	*/
	function size():Int;
}