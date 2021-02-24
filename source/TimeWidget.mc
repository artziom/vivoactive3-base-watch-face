using Toybox.WatchUi;
using Toybox.Application;
using Toybox.Graphics;

using Toybox.System;
using Toybox.Lang;

class TimeWidget extends WatchUi.Drawable {
	private var app;
	private var mainColor, backgroundColor;

	function initialize(params){
		Drawable.initialize(params);
		me.app = Application.getApp();
       	updateColors();        
	}

	function draw(dc){ 
        drawWidget(dc, false);
    }
    
    function updateColors(){
    	me.mainColor = me.app.getProperty("MainColor");
        me.backgroundColor = me.app.getProperty("BackgroundColor");
    }
    
    function getTime(timeFormat){
        var clockTime = System.getClockTime();
        var hours = clockTime.hour;
        if (!System.getDeviceSettings().is24Hour) {
            if (hours > 12) {
                hours = hours - 12;
            }
        }
        return Lang.format(timeFormat, [hours, clockTime.min.format("%02d"), clockTime.sec.format("%02d")]);
    }
        
    function drawWidget(dc, isPartialUpdate){
        if(isPartialUpdate){
        	dc.setClip(120, 85, 50, 25);        	 	
        	dc.setColor(me.mainColor, me.backgroundColor);
	        dc.drawText(120, 80, Graphics.FONT_LARGE, getTime(":$3$"), Graphics.TEXT_JUSTIFY_LEFT);        	
        	dc.clearClip();	      	
        }else{
	        dc.setColor(me.mainColor, Graphics.COLOR_TRANSPARENT);
	        dc.drawText(120, 80, Graphics.FONT_LARGE, getTime("$1$:$2$"), Graphics.TEXT_JUSTIFY_RIGHT);
	        dc.drawText(120, 80, Graphics.FONT_LARGE, getTime(":$3$"), Graphics.TEXT_JUSTIFY_LEFT);
	        dc.clear();
        }
    }
}