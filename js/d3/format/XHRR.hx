package js.d3.format;

import js.d3.XHR;
import js.html.XMLHttpRequest;
import haxe.extern.EitherType;
/**
Copy from XHR
*/
extern class XHRR{
	
	/**
	```js
	d3.csv("path/to/file.csv")
		.row(function(d) { return {key: d.key, value: +d.value}; })
		.get(function(error, rows) { console.log(rows); });
	```
	
	`function callb(Object, index):Object{ this => window(not context) }`
	*/
	@:overload(function():Callb<{}->Int->Dynamic> { })
	function row(set: Callb<{}->Int->Dynamic> ):XHRR;

	
	
	
	@:overload(function(name:String):Null<String> { })
	function header(name:String, value:Null<String>):XHRR;
	
	@:overload(function():Null<String> { } )	
	function mimeType(?type:Null<String>):XHRR;
	
	@:overload(function():Null<XHRResponseType> { } )
	function responseType(?type:Null<XHRResponseType>):XHRR;
	
	function response(value:XMLHttpRequest->Dynamic):XHRR;
	
	function get(?callback:Callb<XMLHttpRequest->EitherType<XMLHttpRequest,Dynamic>->Void>):XHRR;
	

	function post(data:Dynamic, ?callback:Callb<XMLHttpRequest->EitherType<XMLHttpRequest,Dynamic>->Void>):XHRR;
	
	@:overload(function(method:XHRMethodType, ?callback:Callb<XMLHttpRequest->EitherType<XMLHttpRequest,Dynamic>->Void>):XHRR{})
	function send(method:XHRMethodType, data:Dynamic, ?callback:Callb<XMLHttpRequest->EitherType<XMLHttpRequest,Dynamic>->Void>):XHRR;
	
	function abort():XHRR;
	
	@:overload(function(type:XHREventType):EitherType<XMLHttpRequest,Dynamic>->Void{})
	function on(type:XHREventType, ?listener:EitherType<XMLHttpRequest,Dynamic>->Void):XHRR;
}






