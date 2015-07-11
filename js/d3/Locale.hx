package js.d3;
import js.d3.time.Format;


/**

#### Localization

The formatting of numbers, dates and currencies varies by language and locale. While the default build of D3 is intended for U.S. English, you can change the behavior of D3’s formatters by loading new locales as needed. 
 
For example, the default U.S. English (en_US) locale is defined as:

```js
{
  "decimal": ".",
  "thousands": ",",
  "grouping": [3],
  "currency": ["$", ""],
  "dateTime": "%a %b %e %X %Y",
  "date": "%m/%d/%Y",
  "time": "%H:%M:%S",
  "periods": ["AM", "PM"],
  "days": ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
  "shortDays": ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
  "months": ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
  "shortMonths": ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
}

// A locale for Russian (ru_RU) might be defined as:

{
  "decimal": ",",
  "thousands": "\xa0",
  "grouping": [3],
  "currency": ["", " руб."],
  "dateTime": "%A, %e %B %Y г. %X",
  "date": "%d.%m.%Y",
  "time": "%H:%M:%S",
  "periods": ["AM", "PM"],
  "days": ["воскресенье", "понедельник", "вторник", "среда", "четверг", "пятница", "суббота"],
  "shortDays": ["вс", "пн", "вт", "ср", "чт", "пт", "сб"],
  "months": ["января", "февраля", "марта", "апреля", "мая", "июня", "июля", "августа", "сентября", "октября", "ноября", "декабря"],
  "shortMonths": ["янв", "фев", "мар", "апр", "май", "июн", "июл", "авг", "сен", "окт", "ноя", "дек"]
}
```
*/
extern class Locale{

	/**
	The locale’s equivalent of d3.format. 
	*/
	function numberFormat(f:String):Float->String;
	
	/**
	The locale’s equivalent of `d3.time.format`. 
	*/
	function timeFormat(f:String):Format;
	
	/**
	The locale’s equivalent of `d3.time.format.utc`. 
	*/
	inline function timeFormatUtc(f:String):Format return Format.utc(f);
}

typedef LocaleDef = {
	
	/**
	the decimal place string (e.g., "."). 
	*/
	decimal:String,
	
	/**
	the group separator string (e.g., ","). 
	*/
	thousands:String,
	
	/**
	the array of group sizes (e.g., [3]), cycled as needed. 
	*/
	grouping:Array<Int>,
	
	/**
	the currency prefix and suffix strings (e.g., ["$", ""]). 
	*/
	currency:Array<String>,
	
// (Note that the thousands property is a slight misnomer, as the grouping definition allows groups other than thousands.)

// The locale definition must also include the following properties for time formatting:
	
	/**
	the date and time (%c) format string (e.g., "%a %b %e %X %Y") 
	*/
	dateTime:String,
	
	/**
	the date (%x) format string (e.g., "%m/%d/%Y"). 
	*/
	date:String,
	
	/**
	the time (%X) format string (e.g., "%H:%M:%S"). 
	*/
	time:String,
	
	/**
	the locale’s A.M. and P.M. equivalents (e.g., ["AM", "PM"]).
	*/
	periods:Array<String>,
	
	/**
	the full names of the weekdays, starting with Sunday.
	*/
	days:Array<String>,
	
	/**
	the abbreviated names of the weekdays, starting with Sunday.
	*/
	shortDays:Array<String>,

	/**
	the full names of the months (starting with January).
	*/
	months:Array<String>,

	/**
	the abbreviated names of the months (starting with January).
	*/
	shortMonths:Array<String>,
}