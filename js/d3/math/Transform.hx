package js.d3.math;

/**
2D Transforms 
*/
extern class Transform{
	
	/**
	Returns the rotation angle θ of this transform, in degrees. 
	*/
	var rotate:Float;
	
	/**
	Returns the [dx, dy] translation of this transform, as a two-element array in local coordinates (typically pixels). 
	*/
	var translate:Array<Float>;
	
	/**
	Returns the x-skew φ of this transform, in degrees. 
	*/
	var skew:Float;
	
	/**
	Returns the [kx, ky] scale of this transform, as a two-element array.
	*/
	var scale:Array<Float>;
	
	/**
	Returns a string representation of this transform, in the form "translate(dx,dy)rotate(θ)skewX(φ)scale(kx,ky)". 
	*/
	function toString():String;
}