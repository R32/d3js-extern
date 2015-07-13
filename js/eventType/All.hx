package js.eventType;


@:enum abstract SEvent(String) to String {
	
	var ERROR = "error";
	
	var RESIZE = "resize";
	
	var CHANGE = "change";
	
	var CANCEL = "cancel";
	
	var SELECT = "select";
	
	var FOCUS = "focus";

	var BLUR = "blur";
}


@:enum abstract SMouse(String) to String{
	
	var CLICK = "click";
	
	var DBLCLICK = "dblclick";
	
	var MOUSEUP = "mouseup";
	
	var MOUSEDOWN = "mousedown";
	
	var CONTENTMENU = "contentmenu";
	
	var MOUSELEAVE = "mouseleave";
	
	var MOUSEWHEEL = "mousewheel";
	
	var MOUSEOVER = "mouseover";
	
	var MOUSEMOVE = "mousemove";
	
	var MOUSEOUT = "mouseout";
}


@:enum abstract SKeyboard(String) to String {
	
	var KEYPRESS = "keypress";
	
	var KEYDOWN = "keydown";
	
	var KEYUP = "keyup";
}


@:enum abstract SDrag(String) to String {
	
	var DRAG = "drag";
	
	var DRAGSTART = "dragstart";
	
	var DRAGEND = "dragend";
	
	var DRAGOVER = "dragover";
	
	var DRAGENTER = "dragenter";
	
	var DRAGLEAVE = "dragleave";
	
	var DROP = "drop";
}


@:enum abstract STouch(String) to String{
	
	var TOUCHSTART = "touchstart";
	
	var TOUCHEND = "touchend";
	
	var TOUCHMOVE = "touchmove";
	
	var TOUCHENTER = "touchenter";
	
	var TOUCHLEAVE = "touchleave";
	
	var TOUCHCANCEL = "touchcancel";
}