package js.d3.time;

/**
Time intervals are irregular! For example, there are 60 seconds in a minute, but 24 hours in a day. Even more confusing, some days have 23 or 25 hours due to daylight saving time, and the standard Gregorian calendar uses months of differing lengths. And then there are leap years!

To simplify manipulation of and iteration over time intervals, D3 provides a handful of time utilities in addition to the time scale and format. The utilities support both local time and UTC time. Local time is determined by the browser's JavaScript runtime; arbitrary time zone support would be nice, but requires access to the Olson zoneinfo files.

https://github.com/mbostock/d3/wiki/Time-Intervals
*/


extern class Interval extends IntervalUtc{
	
	/**
	IntervalUtc
	*/
	var utc(default,null):IntervalUtc;
}

extern class IntervalUtc {

	/**
	Alias for interval.floor(date). For example, d3.time.day(new Date()) returns midnight (12:00 AM) on the current day, in local time.
	*/
	@:selfCall var selfCall(default, null):Date-> Date;
	
	/**
	Rounds down the specified date, returning the latest time interval before or equal to date. For example, d3.time.day.floor(new Date()) returns midnight (12:00 AM) on the current day, in local time. 
	*/
	function floor(d:Date):Date;
	
	/**
	Rounds up the specified date, returning the earliest time interval after or equal to date. For example, d3.time.day.ceil(new Date()) returns midnight (12:00 AM) on the following day, in local time (unless you happen to run this code at exactly midnight, in which case it returns the current time). 
	*/
	function ceil(d:Date):Date;
	
	/**
	Rounds up or down the specified date, returning the closest time interval to date. For example, d3.time.day.round(new Date()) returns midnight (12:00 AM) on the current day if it is on or before noon, and midnight of the following day if it is after noon. 
	*/
	function round(d:Date):Date;
	
	/**
	Returns every time interval after or equal to start and before stop. If step is specified, then every step'th interval will be returned, based on the interval number (such as day of month for d3.time.day). For example, a step of 2 will return the 1st, 3rd, 5th etc. of the month with d3.time.day. 
	
	zh-cn: 返回 起始至结束之间的 Date 数组, 间隔由不同类型的 step 指定. 如果 day, step = 1 则为 1 天
	*/
	function range(start:Date, stop:Date, step:Float = 1):Array<Date>;
	
	/**
	Returns a new date equal to date plus step intervals. If step is negative, then the returned date will be before the specified date; if step is zero, then a copy of the specified date is returned. This method does not round the specified date to the interval. For example, if it is currently 5:34 PM, then d3.time.day.offset(new Date(), 1) returns 5:34 PM tomorrow (even if Daylight Savings Time changes!).
	*/
	function offset(date:Date, step:Float):Date;
}



extern class Intervals extends IntervalUtcs{
	
	/**
	Returns a corresponding time interval in UTC rather than local time. For example, d3.time.day.range(start, stop) returns local time days between start and stop, while d3.time.day.utc.range(start, stop) returns UTC days between start and stop. 
	*/
	var utc(default,null):IntervalUtcs;
}

extern class IntervalUtcs {
	/**
	Alias for IntervalUtc.range. `function selfCall(start:Date, stop:Date, step:Float = 1):Array<Date>;`
	*/
	@:selfCall var selfCall(default, null):Callb<Date->Date->Float->Array<Date>>;
}