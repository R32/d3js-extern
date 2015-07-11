package js;

/**
ES5
 Opera 11+
 Firefox 3.6+
 Safari 5+
 Chrome 8+
 Internet Explorer 9+
 
 https://github.com/mbostock/d3/wiki/Arrays
*/
extern class JSArray<T> implements ArrayAccess<T> {
	
	var length(default, null) : Int;
	
	function concat( a : Array<T> ) : Array<T>;
	function join( sep : String ) : String;
	function pop() : Null<T>;
	function push(x:haxe.extern.Rest<T>) : Int;
	function reverse() : Void;
	function shift() : Null<T>;
	function slice( pos : Int, ?end : Int ) : Array<T>;
	//function sort( f : T -> T -> Int ) : Void;						// Selection::sort override
	function splice( pos : Int, len : Int ) : Array<T>;
	function toString() : String;
	function unshift( x : T ) : Void;
	
	function indexOf( x : T, ?fromIndex:Int ) : Int;
	function lastIndexOf( x : T, ?fromIndex:Int ) : Int;
	
	// iterator
	function map<S>(cb:Callb<T->Int->Array<T>->S>):Array<S>;
	
	//function filter(cb:Callb<T->Int->Array<T>->Bool>):Array<T>;		// Selection::filter override
	
	function forEach<T>(cb:Callb< T->Int->Array<T>->Void>):Void;	
	function some(cb:Callb<T->Int->Array<T>->Bool>):Bool;
	function every(cb:Callb<T->Int->Array<T>->Bool>):Bool;
	
	function reduce(cb:Callb<T->T->Int->Array<T>->T>, ?init:T):T;
	function reduceRight(cb:Callb<T->T->Int->Array<T>->T>, ?init:T):T;
}