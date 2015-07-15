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

#### difference

Native javascript:

```js
var date = new Date();
var local = d3.time.format("%B");
local(date);							// <--- 1.

// time.format static method
var utc = d3.time.format.utc("%B");		// <--- 2.
utc.parse("May");

d3.timer.flush();						// <--- 3.
```

haxe code:

```haxe
var date = Date.now();
var local = js.D3.time.format("%B");	// Constructs a new time formatter
local.selfCall(date); 			// call self

// time.format static method 
var utc = js.d3.time.Format.utc("%B");	//or utc = Format.utc("%b") if import js.d3.time.Format
utc.parse("May");

D3.timerFlush();
```

Generated JavaScript:

```js
var date = new Date();
var local = d3.time.format("%B");
local(date);
var utc = d3.time.format.utc("%B");
utc.parse("May");
d3.timer.flush();
```

### Status

https://github.com/mbostock/d3/wiki/API-Reference

 - [ ] D3 global
 
 - [x] Selections
 
 - [x] Transitions
 
  - [x] Transition
  
   - [x] Ease - `js.d3.FlxEase`
  
  - [x] Timers - `d3.timer, d3.timerFlush`
  
  - [x] Interpolation - `d3.interpolateXXXXX`
 
 - [x] Working with Arrays - `js.d3.arryas.*`
 
 - [x] Math - `js.d3.math.*`
 
 - [ ] Loading External Resources
 
 - [x] String Formatting
 
 - [ ] CSV Formatting (d3.csv)
 
 - [x] Localization	- `js.d3.Locale, typedef LocaleDef`
 
 - [x] Colors 
 
 - [ ] Namespaces
 
 - [ ] Internals
 
 - [ ] d3.scale (Scales)
 
  - [ ] Quantitative
  
  - [ ] Ordinal
   
 - [ ] d3.svg (SVG)
 
   - [ ] Shapes
   
   - [ ] Axes
   
   - [ ] Controls
   
 - [ ] d3.time (Time) - `js.d3.Time, js.d3.time.*`
 
  - [x] Time Formatting
  
  - [ ] Time Scales
  
  - [ ] Time Intervals
  
 - [ ] d3.layout (Layouts)
 
  - [ ] Bundle
 
  - [ ] Chord
 
  - [ ] Cluster
  
  - [ ] Hierarchy
  
  - [ ] Histogram
  
  - [ ] Pack
  
  - [ ] Partition
  
  - [ ] Pie
  
  - [ ] Stack
  
  - [ ] Tree
  
  - [ ] Treemap

 - [ ] d3.geo (Geography)
 
  - [ ] Paths
 
  - [ ] Projections
 
  - [ ] Streams
 
 - [ ] d3.geom (Geometry)
 
  - [ ] Voronoi
 
  - [ ] Quadtree
 
  - [ ] Polygon
 
  - [ ] Hull
  
 - [x] d3.behavior (Behaviors) - `js.d3.Behavior, js.d3.behavior.*`
	
  - [x] Drag
 
  - [x] Zoom

