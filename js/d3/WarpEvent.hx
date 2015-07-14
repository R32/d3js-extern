package js.d3;


typedef WarpEvent<E,T> = {
	type:String,
	
	sourceEvent:E,
	
	target:T
}