d3js-extern
-------

**WIP**

### Overview

Extern type definitions for `d3 version 3.5.6` and `Haxe 3.2+`.

 * [Original d3js API Reference](https://github.com/mbostock/d3/wiki/API-Reference)

  - Haxe-generated API documentation: `make -f Makefile.docs`
	 
 * [Original d3js Tutorials](https://github.com/mbostock/d3/wiki/Tutorials)

### Features

 * Strict typing, D3js API IntelliSense
 
### Example

```haxe
import js.D3;

class Main {
    static function main() {
      	D3.interpolators.push(function(a, b){
			var re = new js.RegExp("^\\$([0-9,.]+)$");
			var f = D3.format(",.02f");
			var ma = re.exec(a);
			var mb = re.exec(b); 
			if (ma != null && mb != null) {
				var fa = Std.parseFloat(ma[1]);
				var fb = Std.parseFloat(mb[1]) - fa;
				return function(t){
					return "$" + f(fa + fb * t);
				}
			}
			return null;
		});
		
		trace(D3.interpolate("$20", "$10")(1 / 3));		// output: $16.67
    }
}
```

Generated JavaScript:
	

```js
(function () { "use strict";
var test_Test = function() { };
test_Test.main = function() {
	d3.interpolators.push(function(a,b) {
		var re = new RegExp("^\\$([0-9,.]+)$");
		var f = d3.format(",.02f");
		var ma = re.exec(a);
		var mb = re.exec(b);
		if(ma != null && mb != null) {
			var fa = parseFloat(ma[1]);
			var fb = parseFloat(mb[1]) - fa;
			return function(t) {
				return "$" + f(fa + fb * t);
			};
		}
		return null;
	});
	console.log((d3.interpolate("$20","$10"))(0.33333333333333331));
};
test_Test.main();
})();
```

#### difference

native javascript:

```js
var date = new Date();
var local = d3.time.format("%B");
console.log(local(date));				// returns string such as "May" 

// time.format static method
var utc = d3.time.format.utc("%B");
utc.parse("May");
```

haxe:

```haxe
var date = Date.now();
var local = js.D3.time.format("%B");	// Constructs a new time formatter
trace(local.selfCall(date)); 			// call self

// time.format static method 
var utc = js.d3.time.Format.utc("%B");	//or utc = Format.utc("%b") if import js.d3.time.Format
utc.parse("May");						// Tue May 01 1900 08:00:00 GMT+0800
```

Haxe Generated JavaScript:

```js
var date = new Date();
var local = d3.time.format("%B");
console.log(local(date));
var utc = d3.time.format.utc("%B");
utc.parse("May");
```

### Status

https://github.com/mbostock/d3/wiki/API-Reference

 - [] D3 global
 
 - [] Selections
 
 - [] Transitions
 
 - [] Working with Arrays
 
 - [] Math
 
 - [] Loading External Resources
 
 - [] String Formatting
 
 - [] CSV Formatting (d3.csv)
 
 - [] Localization
 
 - [] Colors
 
 - [] Namespaces
 
 - [] Internals
 
 - [] d3.scale (Scales)
 
  - [] Quantitative
  
  - [] Ordinal
   
 - [] d3.svg (SVG)
 
   - [] Shapes
   
   - [] Axes
   
   - [] Controls
   
 - [] d3.time (Time)
 
  - [] Time Formatting
  
  - [] Time Scales
  
  - [] Time Intervals
  
 - [] d3.layout (Layouts)
 
  - [] Bundle
 
  - [] Chord
 
  - [] Cluster
  
  - [] Hierarchy
  
  - [] Histogram
  
  - [] Pack
  
  - [] Partition
  
  - [] Pie
  
  - [] Stack
  
  - [] Tree
  
  - [] Treemap

 
 - [] d3.geo (Geography)
 
  - [] Paths
 
  - [] Projections
 
  - [] Streams
 
 - [] d3.geom (Geometry)
 
  - [] Voronoi
 
  - [] Quadtree
 
  - [] Polygon
 
  - [] Hull
  
 - [] d3.behavior (Behaviors)
 
  - [] Drag
 
  - [] Zoom
