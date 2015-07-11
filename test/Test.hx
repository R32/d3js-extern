package test;


import js.Browser;
import js.Callb;
import js.d3.Color;
import js.d3.time.Format;
import js.JSArray;
import js.D3;
import js.Lib;
import js.d3.FlxEase;
import js.RegExp;

class Test{
	
	
	public static function main() {	
		// for optional params
		/*
		var data = [
			{name:"bob",num:99},
			{name:"tom",num:77},
			{name:"alex",num:33},
		];
		
		var c = d3.select("#content");
		
		
		var ps = c.selectAll("p");
		
		var pd = ps.data([99, 88, 77]);
		
		pd.data(data,function(a,i){
		//console.log(this, a, i)
			if(this instanceof HTMLElement){// simple check
			
			}else{
			
			}
		})
		every character in Chinese has one and only one pronounciation
		
		Japanese vs Chinese, which language is more promising
		*/
		
		var data = [77, 99, 33];
		var c = D3.select("#content");
		var ps = c.selectAll("p");
		
		ps.data(data);
		
		ps.call(function(a, b, c, d) { 
			untyped console.log(Lib.nativeThis == a, a == ps, b, c, d);
		}, 1, 2, 3);
		
		var func:Callb<Int->Int->Void> = function(a:Int):Void { a; };
		
		c.on("click", function(d, i, ig) { 
			trace((D3.event:js.html.MouseEvent).clientX);
			trace(D3.mouse(Lib.nativeThis));
		} );
		
		var width = Browser.document.documentElement.clientWidth;
		
		var tans = D3.select("#piece").transition();
		
		//tans.delay(1000).duration(1000).ease(EaseType.BounceOutIn).style("left", (width - 100)+"px");
		
		trace('"d3.selection().node() == d3.transition().node()\" =\t' + untyped (D3.selection().node() == D3.transition().node()));
		trace("\"d3.select('div') instanceof d3.selection)\" =\t" + untyped __instanceof__(c, D3.selection));
		
		var rgb = D3.rgb(80, 80, 80);
		trace(rgb.toString());
		trace(D3.hsl("red").brighter().darker().toString());
		trace(D3.hcl("red").brighter().darker().toString());
		trace(D3.lab("red").brighter().darker().toString());
		
		untyped console.log(__instanceof__(new BlackColor(), Color));
		
		
		
		D3.interpolators.push(function(a:String, b:String):Float->String {
			var re = new RegExp("^\\$([0-9,.]+)$"), ma, mb, f = D3.format(",.02f");
			var fa:Float, fb:Float;
			if ((ma = re.exec(a)) != null && (mb = re.exec(b)) != null) {
				fa = Std.parseFloat(ma[1]);
				fb = Std.parseFloat(mb[1]) - fa;
				return function(t:Float):String{
					return "$" + f(fa + fb * t);
				}
			}
			return null;
		} );
		
		untyped console.log(D3.interpolate("$20", "$10")(1 / 3));
		
		var zero = D3.format("04d");
		
		
		var format = D3.time.formatMulti([new DFilter(".%L", function(d) { return untyped d.getMilliseconds(); } )]);
		
		var date = Date.now();
		trace(D3.time.formatIso(date));
		//var utc = d3.
	}
	
}

class BlackColor extends Color{
	public function new(){
	}
	override public function rgb():Rgb {
		return D3.rgb(0,0,0);
	}
}

