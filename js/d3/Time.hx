package js.d3;

import js.d3.time.Format;

extern class Time {
	
	/**	
	* Constructs a new local time formatter using the given specifier
	*/
	function format(specifier:String):Format;
	
	/**
	Equivalent to the `d3.time.format.utc`
	*/
	inline function formatUtc(specifier:String):Format return Format.utc(specifier);
		
	/**
	Equivalent to the `d3.time.format.multi` 
	*/
	inline function formatMulti(formats:Array<DFilter>):Date-> String return Format.multi(formats);
	
	/**
	Equivalent to the `d3.time.format.iso` 
	*/
	inline function formatIso(date:Date):String return Format.iso(date);
	// --------------------------------------------------------
}