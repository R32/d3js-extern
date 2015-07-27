package js.d3;

import haxe.extern.EitherType;

/**
https://developer.mozilla.org/en-US/docs/Glossary/Primitive

In JavaScript, there are 6 primitive data types:

 * string

 * number

 * Boolean

 * null

 * undefined

 * symbol (new in ECMAScript 6)
*/
typedef Primitive = Null<EitherType<String,EitherType<Float,EitherType<Int,Bool>>>>;