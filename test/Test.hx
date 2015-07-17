package test;

import js.Browser;
import js.Callb;
import js.d3.Color;
import js.d3.Dispatch;
import js.d3.Selection;
import js.d3.time.Format;
import js.JSArray;
import js.D3;
import js.Lib;
import js.d3.FlxEase;
import js.eventType.All;
import js.d3.behavior.Zoom;
import js.d3.Transition;
import js.d3.behavior.Drag;
import js.d3.behavior.Zoom;
import js.d3.XHR;
import js.d3.format.*;
import js.d3.scales.*;

class Test{
	
	
	public static function main() {	
		var data = [77, 99, 33];
		var c = D3.select("#content");
		var ps = c.selectAll("p");
		
		ps.data(data);
		
		ps.call(function(a, b, c, d) { 
			untyped console.log(Lib.nativeThis == a, a == ps, b, c, d);
		}, 1, 2, 3);
		
		var func:Callb<Int->Int->Void> = function(a:Int):Void { a; };
		
		c.on("click", function(d, i, ig) { 
			trace('clientX: ${(D3.event:js.html.MouseEvent).clientX}, d3.mouse: [ ${D3.mouse(Lib.nativeThis).join(", ")}');
		} );
		trace("\"d3.select('div') instanceof d3.selection\": " + untyped __instanceof__(c, D3.selection));

		
		trace('normal: ${D3.random.normal()()}, bates: ${D3.random.bates(10)()}, ' +
		'logNormal: ${D3.random.logNormal()()}, irwinHall: ${D3.random.irwinHall(10)()}'	
		);
		

		testFormat();
		testTransition(c);
		testColor();
		testDrag(); 
		testZoom();
		testMisc();
		testTime();
		//testXhr();
	}
	
	static function testTime(){		
		var date = D3.time.day.selfCall(Date.now());
		var dateutc = D3.time.day.utc.selfCall(Date.now());
		var scale = D3.time.scale();
		scale.domain([untyped __js__('new Date("2015-1-1")'), Date.now()]);
		var range = scale.ticks(D3.time.day, 31);
		trace(range);
	}
	
	static function testMisc(){
		trace(D3.ns.qualify("svg:text").space);
		D3.timer.selfCall(function() { return true; } );
		D3.timer.flush();	
		var dp:Dispatch = D3.dispatch("hi", "bye");
		dp.hi().hi();
		
		var le = D3.scale.linear();
		le.interpolate(D3.interpolateRound);
		le.range([0, 1]);
		trace("linear: " + untyped le.selfCall(0.5));
		
		var pow = D3.scale.sqrt();
		var log = D3.scale.log();
		
	}
	
	static function testXhr(){
		var x = D3.xhr("style.css");
		x.responseType(XHRResponseType.TEXT);
		x.response(function(resp) { return "HEAD Request"; } );
		x.on(XHREventType.LOAD, function(str:String) { trace('testXhr: ${str}'); } );
		x.send(XHRMethodType.HEAD);
		
		var y = D3.csv.selfCall("csv.txt",function(d){
			return d.Make;
		},function(err,data){
			trace( 'testCSv: ${(data.join(","))}');
		});
			
		D3.dsv("|", "text/plain").selfCall("csv.txt");
		
		D3.tsv.selfCall("csv.txt");
	}
	
	static function testZoom() {
		var c = D3.select("#piece");
		var zoom = D3.behavior.zoom();
		zoom.center([50, 50])
			.scaleExtent([1, 10])
			.on(ZoomEventType.ZOOM, function(d, i, j) {
				trace('testZoom: ,translate: ${untyped D3.event.translate}, scale: ${untyped D3.event.scale}');
			} );
		c.call(zoom.selfCall);
		
		zoom.event(D3.select("#drag"));
	}
	
	static function testDrag() {
		var c = D3.select("#piece");
		var drag = D3.behavior.drag();
		/*
		if(!c.empty()){	// Native Drag			
			c.attr("draggable",true).on(SDrag.DRAGSTART, function(a, i, gi) { 
				(D3.event:js.html.DragEvent).dataTransfer.setData("Text",Lib.nativeThis.id);
			} );		
			D3.select("#content").on(SDrag.DRAGOVER, function() { 
				(D3.event:js.html.DragEvent).preventDefault();
			}).on(SDrag.DROP,function(){
				var e = (D3.event:js.html.DragEvent);
				e.preventDefault();
				var id = e.dataTransfer.getData("Text");
				if (id != "") {
					var tar:js.html.Node = cast e.target;
					tar.appendChild(js.Browser.document.getElementById(id));
				}else{
					trace("have not set dataTransfer");
				}
			});
		}
		*/
		
		c.call(drag.selfCall);
		
		drag.origin(function(d, i, j) { untyped console.log(D3.event); return {x:0,y:0}; } ).on(DragEventType.DRAG, function() {
			var e:js.d3.behavior.Drag.DragingEvent = D3.event;
			trace('testDrag: x: ${e.x},y: ${e.y}, dx: ${e.dx},dy: ${e.dy}');
		});
	}
	
	static function testColor(){
		var rgb = D3.rgb(80, 80, 80);
		trace('rgb: ${rgb.toString()}' +
			', hsl: ${D3.hsl("red").brighter().darker().toString()}' +
			', hcl: ${D3.hcl("red").brighter().darker().toString()}' + 
			', lab: ${D3.lab("red").brighter().darker().toString()}' +
			', blackColor instanceof Color: ${untyped __instanceof__(new BlackColor(), Color)}'
		);
	}
	
	static function testTransition(c:Selection){
		var width = Browser.document.documentElement.clientWidth;
		
		D3.select("#piece font").transition().delay(200).duration(1000).attrTween("color", function(d, i, s) {
			return D3.interpolateRgb(s, "#000000");
		}).style( { "background-color":"#ffffff", "font-size":"48px" } );
		
		D3.select("p.second")
			.datum(function() {
				return Lib.nativeThis.textContent;
			})
			.transition("hi")
			.delay(300)
			.duration(1000)
			.tween("text",function(){
				var it = D3.interpolateRound(0, 100);
				return function(t){
					Lib.nativeThis.textContent = it(t);
				}
			}).transition().delay(2000).text(function(d) { return d; } ).style("color", "#a71d5d");
			
		
		D3.select("#piece").transition().delay(200).duration(1000).ease(EaseType.LinearIn).style("left", (width - 120)+"px");
		
		trace('"d3.selection().node() == d3.transition().node()\": ' + untyped (D3.selection().node() == D3.transition().node()));
		
	}
	
	static function testFormat(){
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
		} );
		var date = Date.now();
		trace(D3.interpolate("$20", "$10")(1 / 3));		// output: $16.67
		
		var monthNameFormat = D3.time.format("%B");		
		trace(monthNameFormat.selfCall(date));
		var zero = D3.format("04d");
		var format = Format.multi([new DFilter(".%L", function(d) { return untyped d.getMilliseconds(); } )]);		
		var date = Date.now();
		trace(Format.iso(date));
		
	}
	
	static function assertTrue( b:Bool, msg:String = "expected true but was false") : Void {
		if (!b) throw msg;
	}
	
}

class BlackColor extends Color{
	public function new(){
	}
	override public function rgb():Rgb {
		return D3.rgb(0,0,0);
	}
}

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
		
		//every character in Chinese has one and only one pronounciation
		
		//Japanese vs Chinese, which language is more promising
		
*/