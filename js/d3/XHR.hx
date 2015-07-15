package js.d3;

import js.html.XMLHttpRequest;
import haxe.extern.EitherType;
/**
https://github.com/mbostock/d3/wiki/Requests#xhr

Note: `EitherType<XMLHttpRequest, Dynamic>` Determined by the response callback function's return value
*/
extern class XHR{

	/**
	If value is specified, sets the request header with the specified name to the specified value. If value is null, removes the request header with the specified name. If value is not specified, returns the current value of the request header with the specified name. Header names are case-insensitive.
	
	Request headers can only be modified before the request is sent. Therefore, you cannot pass a callback to the d3.xhr constructor if you wish to specify a header. Instead, use xhr.get or similar. For example:

	```js
	d3.csv("/path/to/file.csv")
		.header("header-name", "header-value")
		.get(function(error, data) {
			// callback
		});
	```
	*/
	@:overload(function(name:String):Null<String> { })
	function header(name:String, value:Null<String>):XHR;
	
	/**
	If type is specified, sets the request mime type to the specified value. If type is null, clears the current mime type, if any. If type is not specified, returns the current mime type, which defaults to null. The mime type is used to both set the "Accept" request header and for overrideMimeType, where supported. Request headers can only be modified before the request is sent. 
	*/
	@:overload(function():Null<String> { } )	
	function mimeType(?type:Null<String>):XHR;
	
	
	/**
	If type is specified, sets the response type, e.g. "", "arraybuffer", "blob", "document", or "text". If type is not specified, returns the current response type, which defaults to "".
	*/
	@:overload(function():Null<XHRResponseType> { } )
	function responseType(?type:Null<XHRResponseType>):XHR;
	
	/**
	If value is specified, sets the response value function to the specified function. ~~If value is not specified, returns the current response value function~~, which defaults to the identity function. The response value function is used to map the response XMLHttpRequest object to its associated data value. For example, for text requests, you might use `function(request) { return request.responseText; }`, whereas for JSON requests, you might use `function(request) { return JSON.parse(request.responseText); }`. 
	
	zh-CN: ??? 如参数留空将移除 response 处理函数???
	*/
	function response(value:XMLHttpRequest->Dynamic):XHR;
	
	/**
	Issues this request using the GET method. If a callback is specified, it will be invoked asynchronously when the request is done or errors; the callback is invoked with two arguments: the error, if any, and the response value. The response value is undefined if an error occurs. If no callback is specified, then "load" and "error" listeners should be registered via xhr.on. This method is a convenience wrapper of xhr.send. 
	*/
	function get(?callback:Callb<XMLHttpRequest->EitherType<XMLHttpRequest,Dynamic>->Void>):XHR;
	
	/**
	Issues this request using the POST method, optionally posting the specified data in the request body. If a callback is specified, it will be invoked asynchronously when the request is done or errors; the callback is invoked with two arguments: the error, if any, and the response value. The response value is undefined if an error occurs. If no callback is specified, then "load" and "error" listeners should be registered via xhr.on. This method is a convenience wrapper of xhr.send.
	
	```js
	d3.csv("/path/to/file.csv")
		.header("Content-Type", "application/x-www-form-urlencoded")
		.post("a=2&b=3", function(error, data) {
			// callback
		});
	
	//An example using JSON encoding:

	d3.csv("/path/to/file.csv")
		.header("Content-Type", "application/json")
		.post(JSON.stringify({a: 2, b: 3}), function(error, data) {
			// callback
		});
	```
	*/
	function post(data:Dynamic, ?callback:Callb<XMLHttpRequest->EitherType<XMLHttpRequest,Dynamic>->Void>):XHR;
	
	/**
	Issues this request using the specified method, optionally posting the specified data in the request body. If a callback is specified, it will be invoked asynchronously when the request is done or errors; the callback is invoked with two arguments: the error, if any, and the response value. The response value is undefined if an error occurs. If no callback is specified, then "load" and "error" listeners should be registered via xhr.on. 
	*/
	@:overload(function(method:XHRMethodType, ?callback:Callb<XMLHttpRequest->EitherType<XMLHttpRequest,Dynamic>->Void>):XHR{})
	function send(method:XHRMethodType, data:Dynamic, ?callback:Callb<XMLHttpRequest->EitherType<XMLHttpRequest,Dynamic>->Void>):XHR;
	
	/**
	Aborts this request, if it is currently in-flight. See XMLHttpRequest’s abort. 
	*/
	function abort():XHR;
	
	/**
	Adds or removes an event listener to this request for the specified type. The type must be one of the following:


	 - beforesend - before the request is sent, to allow custom headers and the like to be set.

	 - progress - to monitor the progress of the request.

	 - load - when the request completes successfully.

	 - error - when the request completes unsuccessfully; this includes 4xx and 5xx response codes.

	If an event listener was already registered for the same type, the existing listener is removed before the new listener is added. To register multiple listeners for the same event type, the type may be followed by an optional namespace, such as "load.foo" and "load.bar". To remove a listener, pass null as the listener. 
	*/
	@:overload(function(type:XHREventType):EitherType<XMLHttpRequest,Dynamic>->Void{})
	function on(type:XHREventType, ?listener:EitherType<XMLHttpRequest,Dynamic>->Void):XHR;
}

@:enum abstract XHRResponseType(String) to String {
	
	var EMPTY = "";
	
	var ARRAYBUFFER = "arraybuffer";
	
	var BLOB = "blob";
	
	var DOCUMENT = "document";
	
	var JSON = "json";
	
	var TEXT = "text";
}

@:enum abstract XHRMethodType(String) to String {
	
	var POST = "POST";
	
	var GET = "GET";
	
	var HEAD = "HEAD";
}

@:enum abstract XHREventType(String) to String{
	
	var LOAD = "load";
	
	var ERROR = "error";
	
	var BEFORESEND = "beforesend";
	
	var PROGRESS = "progress";
}