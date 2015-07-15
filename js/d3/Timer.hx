package js.d3;

/**
D3 internally maintains an efficient timer queue so that thousands of timers can be processed concurrently with minimal overhead; in addition, this timer queue guarantees consistent timing of animations when concurrent or staged transitions are scheduled. If your browser supports it, the timer queue will use requestAnimationFrame for fluid and efficient animation. The timer queue is also smart about using setTimeout when there is a long delay before the next scheduled event. 
*/
extern class Timer{
	
	/**
	Start a custom animation timer, invoking the specified function repeatedly until it returns true. There is no way to cancel the timer after it starts, so make sure your timer function returns true when done!
	
	An optional numeric delay in milliseconds may be specified when the given function should only be invoked after a delay. The delay is relative to the specified time in milliseconds since UNIX epoch; if time is not specified, it defaults to Date.now.
	
	You may use delay and time to specify relative and absolute moments in time when the function should start being invoked. For example, a calendar notification might be coded as:
	
	```js
	// four hours before midnight October 29 (months are zero-based)
	d3.timer(notify, -4 * 1000 * 60 * 60, +new Date(2012, 09, 29));
	
	// timer(Float->Bool, delay = 0, time = Date.now()):Void{
	//	 this = {t=>arg_time, c=>arg_func, f=>[prev_return_value=false], n=>[null=sub_timer]	}
	//}
	```
	
	Note that if d3.timer is called within the callback of another timer, the new timer will be invoked immediately at the end of the current frame (if active as determined by the specified delay and time), rather than waiting until the next frame.
	
	zh_CN: 直到回调函数返回 true 值. 注意: 如果一个新 d3.timer 在 另一个 timer 回调中被调用, 那么这个新 timer 将在结束当前 timer 才开始调用.	 
	*/
	@:selfCall function selfCall(func:Callb<Float->Primitive>, ?delay:Float, ?time:Float):Void;
	
	/**
	Immediately execute (invoke once) any active timers. Normally, zero-delay transitions are executed after an instantaneous delay (<10ms). This can cause a brief flicker if the browser renders the page twice: once at the end of the first event loop, then again immediately on the first timer callback. By flushing the timer queue at the end of the first event loop, you can run any zero-delay transitions immediately and avoid the flicker.
	
	zh_CN: 立刻执行当前没有延迟的计时。可用于处理闪屏问题
	*/
	function flush():Void;
}