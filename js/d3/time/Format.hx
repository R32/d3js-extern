package js.d3.time;

/**
D3 includes a helper module for parsing and formatting dates modeled after the venerable strptime and strftime C-library standards. These functions are also notably available in Python's time module.

(Equivalent to locale.timeFormat for the default U.S. English locale.) The specifier string may contain the following directives.

 - `%a` - abbreviated weekday name.

 - `%A` - full weekday name.

 - `%b` - abbreviated month name.

 - `%B` - full month name.

 - `%c` - date and time, as "%a %b %e %H:%M:%S %Y".

 - `%d` - zero-padded day of the month as a decimal number [01,31].

 - `%e` - space-padded day of the month as a decimal number [ 1,31]; equivalent to %_d.

 - `%H` - hour (24-hour clock) as a decimal number [00,23].

 - `%I` - hour (12-hour clock) as a decimal number [01,12].

 - `%j` - day of the year as a decimal number [001,366].

 - `%m` - month as a decimal number [01,12].

 - `%M` - minute as a decimal number [00,59].

 - `%L` - milliseconds as a decimal number [000, 999].

 - `%p` - either AM or PM.

 - `%S` - second as a decimal number [00,61].

 - `%U` - week number of the year (Sunday as the first day of the week) as a decimal number [00,53].

 - `%w` - weekday as a decimal number [0(Sunday),6].

 - `%W` - week number of the year (Monday as the first day of the week) as a decimal number [00,53].

 - `%x` - date, as "%m/%d/%Y".

 - `%X` - time, as "%H:%M:%S".

 - `%y` - year without century as a decimal number [00,99].

 - `%Y` - year with century as a decimal number.

 - `%Z` - time zone offset, such as "-0700".

 - `%%` - a literal "%" character.
 
For `%U`, all days in a new year preceding the first Sunday are considered to be in week 0. For `%W`, all days in a new year preceding the first Monday are considered to be in week 0. In some implementations of strftime and strptime (as in Python), a directive may include an optional field width or precision; this feature is not yet implemented in D3, but may be added in the future. 

For locale-specific date and time formatters, see locale.timeFormat.

The % sign indicating a directive may be immediately followed by a padding modifier:

 - `0` - zero-padding

 - `_` - space-padding

 - `-` - disable padding

If no padding modifier is specified, the default is 0 for all directives, except for `%e` which defaults to `_`).

The returned format is both an object and a function. For example:

```js
var format = d3.time.format("%Y-%m-%d");
format.parse("2011-01-01"); // returns a Date
format(new Date(2011, 0, 1)); // returns a string
```
*/
@:native("d3.time.format") extern class Format{
	
	/**
	Formats the specified date, returning the corresponding string. The date must be a JavaScript Date object. 
	
	```js
	var monthNameFormat = d3.time.format("%B");
	var dayNameFormat = d3.time.format("%A");
	var date = new Date(2014, 4, 1);
	
	// Haxe code: monthNameFormat.selfCall(date);
	monthNameFormat(date);	//returns string "May" (remember javascript months are zero-indexed, thus 4 = May)
	
	// haxe code: monthNameFormat.selfCall(date);
	dayNameFormat(date);	//returns string "Thursday"	 
	```
	
	
	Note that when dates are used in conjunction with quantitative scales, the dates are implicitly coerced to numbers representing the number of milliseconds since UNIX epoch. To convert between numbers and dates, you can use the following code:
	
	```js
	time = +date; 			// convert a Date object to time in milliseconds
	date = new Date(time);	// convert a time in milliseconds to a Date object
	```
	
	If you prefer to be explicit, you can also use the date object's getTime method, but the + operator is shorter and possibly faster.
	*/
	@:selfCall function selfCall(date:Date):String;
	
	
	/**
	Parses the specified string, returning the corresponding date object. If the parsing fails, returns null. Unlike "natural language" date parsers (including JavaScript's built-in parse), this method is strict: if the specified string does not exactly match the associated format specifier, this method returns null. 
	
	For example, if the associated format is the full ISO 8601 string "%Y-%m-%dT%H:%M:%SZ", then the string "2011-07-01T19:15:28Z" will be parsed correctly, but "2011-07-01T19:15:28", "2011-07-01 19:15:28" and "2011-07-01" will return null, despite being valid 8601 dates. (Note that the hard-coded "Z" here is different from %Z, the time zone offset.) If desired, you can use multiple formats to try multiple format specifiers sequentially. 
	
	The `%d` and `%e` format specifiers are considered equivalent for parsing.
	
	zh-CN: 将 selfCall() 的返回值 解析成相应的 Date 对象,
	*/
	function parse(str:String):Date;
	
	
	/**
	Returns a new multi-resolution time format given the specified array of predicated formats. Each format is a two-element array consisting of a format specifier string (such as that passed to the d3.time.format constructor) and a predicate function. For any date that is passed to the returned time format, the first predicate function that returns true will determine how the specified date is formatted. For example, the default time format used by d3.time.scale is implemented as: 
	
	```js
	var format = d3.time.format.multi([
		[".%L", function(d) { return d.getMilliseconds(); }],
		[":%S", function(d) { return d.getSeconds(); }],
		["%I:%M", function(d) { return d.getMinutes(); }],
		["%I %p", function(d) { return d.getHours(); }],
		["%a %d", function(d) { return d.getDay() && d.getDate() != 1; }],
		["%b %d", function(d) { return d.getDate() != 1; }],
		["%B", function(d) { return d.getMonth(); }],
		["%Y", function() { return true; }]
	]);
	```
	
	Thus, if the specified date is not a round second, the milliseconds format (".%L") is used; otherwise, if the specified date is not a round minute, the seconds format (":%S") is used, and so on. See [bl.ocks.org/4149176](http://bl.ocks.org/mbostock/4149176) for an example.
	
	The multi method is available on any d3.time.format constructor. For example, d3.time.format.utc.multi returns a multi-resolution UTC time format, and locale.timeFormat.multi returns a multi-resolution time format for the specified locale.
	
	zh-CN: 返回一个函数, 当给这个函数传入一个 Date 类型参数时, 将返回第一个 返回值不为 `false|null|0|""` 相对应的项,如果全都没匹配,很可能将抛出错误.
	*/
	static function multi(formats:Array<DFilter>):Date->Primitive;
	
	
	/**
	Constructs a new UTC time formatter using the given specifier. (Equivalent to locale.timeFormat.utc for the default U.S. English locale.) The specifier may contain the same directives as the local time format. Internally, this time formatter is implemented using the UTC methods on the Date object, such as getUTCDate and setUTCDate in place of getDate and setDate. 
	
	zh-CN: 和 Format 一样, 但使用 utc 的方法如 getUTCDate 获取时间值.
	*/
	static function utc(specifier:String):Format;
	
	/**
	The full ISO 8601 UTC time format: "%Y-%m-%dT%H:%M:%S.%LZ". Where available, this method will use Date.toISOString to format and the Date constructor to parse strings. If you depend on strict validation of the input format according to ISO 8601, you should construct a time format explicitly instead:
	
	```js
	var iso = d3.time.format.utc("%Y-%m-%dT%H:%M:%S.%LZ");
	```
	*/
	static function iso(date:Date):String;
}


abstract DFilter(Array<Dynamic>) from Array<Dynamic>{
	public inline function new(specifier:String, callb:Date->Null<Bool>){
		this = [specifier, callb];
	}
}