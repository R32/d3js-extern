package js.d3;

import js.d3.time.Format;
import js.d3.time.Scale;
import js.d3.time.Interval;

extern class Time {
	
	/**	
	* Constructs a new local time formatter using the given specifier
	*/
	function format(specifier:String):Format;
	
	/**
	Constructs a new time scale with the default domain and range; the ticks and tick format are configured for local time. 
	*/
	function scale():Scale;
	
	/**
	Returns the specified interval. The following intervals are supported:
	*/
	var second(default, null):Interval;
	var seconds(default, null):Intervals;
	
	var minute(default, null):Interval;
	var minutes(default, null):Intervals;
	
	var hour(default, null):Interval;
	var hours(default, null):Intervals;
	
	var day(default, null):Interval;
	var days(default, null):Intervals;
	
	var week(default, null):Interval;
	var weeks(default, null):Intervals;
	
	var sunday(default, null):Interval;
	var sundays(default, null):Intervals;
	
	var monday(default, null):Interval;
	var mondays(default, null):Intervals;
	
	var tuesday(default, null):Interval;
	var tuesdays(default, null):Intervals;
	
	var wednesday(default, null):Interval;
	var wednesdays(default, null):Intervals;
	
	var thursday(default, null):Interval;
	var thursdays(default, null):Intervals;
	
	var friday(default, null):Interval;
	var fridays(default, null):Intervals;
	
	var saturday(default, null):Interval;
	var saturdays(default, null):Intervals;
	
	var month(default, null):Interval;
	var months(default, null):Intervals;
	
	var year(default, null):Interval;
	var years(default, null):Intervals;
	
	
	/**
	Returns the day number for the given date. The first day of the year (January 1) is always the 0th day. Unlike the d3.time.format's %j directive, dayOfYear is 0-based rather than 1-based.
	*/
	function dayOfYear(d:Date):Int;
	
	function weekOfYear(d:Date):Int;
	
	function sundayOfYear(d:Date):Int;
	
	function mondayOfYear(d:Date):Int;
	
	function tuesdayOfYear(d:Date):Int;
	
	function wednesdayOfYear(d:Date):Int;
		
	function thursdayOfYear(d:Date):Int;
	
	function fridayOfYear(d:Date):Int;
	
	function saturdayOfYear(d:Date):Int;
}