package js.d3.behavior;

/**
https://github.com/mbostock/d3/wiki/Zoom-Behavior
*/
extern class Zoom{
	
	/**
	Applies the zoom behavior to the specified selection, registering the necessary event listeners to support panning and zooming. 
	*/
	@:selfCall var selfCall(default, null):Selection->Void;
	
	/**
	Specifies the current zoom translation vector. If not specified, returns the current translation vector, which defaults to [0, 0]. 
	
	zh-CN: ???当缩放时处理坐标
	*/
	function translate(?translate:Array<Float>):Zoom;
	
	/**
	Specifies the current zoom scale. If not specified, returns the current zoom scale, which defaults to 1. 
	*/
	function scale(scale:Float = 1.0):Zoom;
	
	/**
	Specifies the zoom scale's allowed range as a two-element array, [minimum, maximum]. If not specified, returns the current scale extent, which defaults to [0, Infinity]. 
	*/
	function scaleExtent(?extent:Array<Float>):Zoom;
	
	/**
	If center is specified, sets the [focal point](http://bl.ocks.org/mbostock/6226534) [x, y] for mousewheel zooming and returns this zoom behavior. If center is not specified, returns the current focal point, which defaults to null. A null center indicates that mousewheel zooming should zoom in and out around the current mouse location. 
	*/
	function center(center:Null<Array<Float>> = null):Zoom;
	
	/**
	If size is specified, sets the viewport size to the specified dimensions [width, height] and returns this zoom behavior. If size is not specified, returns the current viewport size which defaults to [960, 500]. A size is needed to support [smooth zooming](https://github.com/mbostock/d3/wiki/Transitions#d3_interpolateZoom) during transitions. 
	*/
	function size(?size:Array<Int>):Zoom;
	
	/**
	Specifies an x-scale whose domain should be automatically adjusted when zooming. If not specified, returns the current x-scale, which defaults to null. If the scale's domain or range is modified programmatically, this function should be called again. Setting the x-scale also resets the scale to 1 and the translate to [0, 0]. 
	*/
	function x(x:Null<Float> = null):Zoom;
	
	/**
	Specifies an y-scale whose domain should be automatically adjusted when zooming. If not specified, returns the current y-scale, which defaults to null. If the scale's domain or range is modified programmatically, this function should be called again. Setting the y-scale also resets the scale to 1 and the translate to [0, 0]. 
	*/
	function y(y:Null<Float> = null):Zoom;
	
	/**
	Registers the specified listener to receive events of the specified type from the zoom behavior. The following types are supported:

	 - zoomstart - at the start of a zoom gesture (e.g., touchstart).

	 - zoom - when the view changes (e.g., touchmove).

	 - zoomend - at the end of the current zoom gesture (e.g., touchend).
	 
	If an event listener was already registered for the same type, the existing listener is removed before the new listener is added. To register multiple listeners for the same event type, the type may be followed by an optional namespace, such as "zoom.foo" and "zoom.bar". To remove a listener, pass null as the listener.

	For mousewheel events, which happen discretely with no explicit start and end reported by the browser, events that occur within 50 milliseconds of each other are grouped into a single zoom gesture. If you want more robust interpretation of these gestures, please petition your browser vendor of choice for better touch event support.

	When fired, the d3.event object will contain the following properties:

	 - scale - a number; the current scale.
	 
	 - translate - a two-element array representing the current translation vector. 
	*/
	@:overload(function(type:ZoomEventType):Null<Callb<Dynamic->Int->Int->Void>>{})
	function on(type:ZoomEventType, listener:Null<Callb<Dynamic->Int->Int->Void>>):Zoom;
	
	/**
	If selection is a selection, immediately dispatches a zoom gesture to registered listeners, as the three event sequence zoomstart, zoom and zoomend. This can be useful in triggering listeners after setting the translate or scale programatically. If selection is a transition, registers the appropriate tweens so that the zoom behavior dispatches events over the course of the transition: a zoomstart event when the transition starts from the previously-set view, zoom events for each tick of the transition, and finally a zoomend event when the transition ends. Note that the transition will be interrupted if the user starts zooming before the transition ends. 
	*/
	@:overload(function(transition:js.d3.Transition):Void{})
	function event(selection:js.d3.Selection):Void;
}

@:enum abstract ZoomEventType(String) to String {
	
	var ZOOMSTART = "zoomstart";	// at the start of a zoom gesture (e.g., touchstart).
	
	var ZOOM = "zoom";				// when the view changes (e.g., touchmove).
	
	var ZOOMEND = "zoomend";		// at the end of the current zoom gesture (e.g., touchend).
}

/**
zoom events (but not dragstart and dragend events) 
*/
typedef ZoomEvent = { > WarpEvent<Zoom, js.html.WheelEvent>,

	scale:Float,
	
	translate:Array<Float>,
}
