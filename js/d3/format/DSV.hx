package js.d3.format;

import js.d3.XHR;
import js.html.XMLHttpRequest;
import haxe.extern.EitherType;

/**
Arbitrary Delimiters 
*/
@:native("d3.dsv") extern class DSV {
	
	/**
	Issues an HTTP GET request for the comma-separated values (CSV) file at the specified url. The file contents are assumed to be [RFC4180-compliant](http://tools.ietf.org/html/rfc4180). The mime type of the request will be "text/csv". The request is processed asynchronously, such that this method returns immediately after opening the request. When the CSV data is available, the specified callback will be invoked with the parsed rows as the argument. If an error occurs, the callback function will instead be invoked with null. An optional accessor function may be specified, which is then passed to d3.csv.parse; the accessor may also be specified by using the return request object’s row function. For example: 
	
	```js
	d3.csv("example.csv", function(d) {
	  return {
		year: new Date(+d.Year, 0, 1), // convert "Year" column to Date
		make: d.Make,
		model: d.Model,
		length: +d.Length // convert "Length" column to number
	  };
	}, function(error, rows) {
	  console.log(rows);
	});
	```
	See the [unemployment choropleth](http://bl.ocks.org/mbostock/4060606) for an example.
	*/	
	@:selfCall
	@:overload(function(url:String, ?callback:XMLHttpRequest->Array<{}>->Void):XHRR { } )	
	function selfCall(url:String, accessor:Callb<{}->Int->Dynamic>, ?callback:XMLHttpRequest->Array<Dynamic>->Void):XHRR;
	
	/**
	Parses the specified string, which is the contents of a CSV file, returning an array of objects representing the parsed rows. The string is assumed to be RFC4180-compliant. Unlike the parseRows method, this method requires that the first line of the CSV file contains a comma-separated list of column names; these column names become the attributes on the returned objects. For example, consider the following CSV file:
	
	```csv
	Year,Make,Model,Length
	1997,Ford,E350,2.34
	2000,Mercury,Cougar,2.38
	```
	The resulting JavaScript array is:
	
	```js
	[
		{"Year": "1997", "Make": "Ford", "Model": "E350", "Length": "2.34"},
		{"Year": "2000", "Make": "Mercury", "Model": "Cougar", "Length": "2.38"}
	]
	```
	Note that the values themselves are always strings; they will not be automatically converted to numbers. JavaScript may coerce strings to numbers for you automatically (for example, using the + operator). By specifying an accessor function, you can convert the strings to numbers or other specific types, such as dates:
	
	```js
	d3.csv("example.csv", function(d) {
	  return {
		year: new Date(+d.Year, 0, 1), // convert "Year" column to Date
		make: d.Make,
		model: d.Model,
		length: +d.Length // convert "Length" column to number
	  };
	}, function(error, rows) {
	  console.log(rows);
	});	
	```
	
	Using + rather than parseInt or parseFloat is typically faster, though more restrictive. For example, "30px" when coerced using + returns NaN, while parseInt and parseFloat return 30.
	*/
	function parse(str:String, ?accessor:Callb<{}->Int->Dynamic>):Array<Dynamic>;
	
	/**
	Parses the specified string, which is the contents of a CSV file, returning an array of arrays representing the parsed rows. The string is assumed to be RFC4180-compliant. Unlike the parse method, this method treats the header line as a standard row, and should be used whenever the CSV file does not contain a header. Each row is represented as an array rather than an object. Rows may have variable length. For example, consider the following CSV file:

	```csv
	1997,Ford,E350,2.34
	2000,Mercury,Cougar,2.38
	```
	
	The resulting JavaScript array is:
	
	```js
	[
	  ["1997", "Ford", "E350", "2.34"],
	  ["2000", "Mercury", "Cougar", "2.38"]
	]
	```
	Note that the values themselves are always strings; they will not be automatically converted to numbers. See parse for details.

	An optional accessor function may be specified as the second argument. This function is invoked for each row in the CSV file, being passed the current row and index as two arguments. The return value of the function replaces the element in the returned array of rows; if the function returns null, the row is stripped from the returned array of rows. In effect, the accessor is similar to applying a map and filter operator to the returned rows. The accessor function is used by parse to convert each row to an object with named attributes. 
	*/
	function parseRows(str:String, ?accessor:Callb<Array<String>->Int->Dynamic>):Array<Dynamic>;
	
	/**
	Converts the specified array of rows into comma-separated values format, returning a string. This operation is the reverse of parse. Each row will be separated by a newline (\n), and each column within each row will be separated by a comma (,). Values that contain either commas, double-quotes (") or newlines will be escaped using double-quotes.

	Each row should be an object, and all object properties will be converted into fields. For greater control over which properties are converted, convert the rows into arrays containing only the properties that should be converted and use formatRows.
	*/
	function format(rows:Array<Dynamic>):String;
	
	/**
	Converts the specified array of rows into comma-separated values format, returning a string. This operation is the reverse of parseRows. Each row will be separated by a newline (\n), and each column within each row will be separated by a comma (,). Values that contain either commas, double-quotes (") or newlines will be escaped using double-quotes. 
	*/
	function formatRows(rows:Array<Array<Primitive>>):String;	
}