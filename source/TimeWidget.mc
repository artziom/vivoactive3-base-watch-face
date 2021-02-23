using Toybox.WatchUi;
using Toybox.Application;
using Toybox.Graphics;

using Toybox.System;
using Toybox.Lang;

class TimeWidget extends WatchUi.Drawable {
	function initialize(params){
		Drawable.initialize(params);
	}

	function draw(dc){
		dc.setColor(Application.getApp().getProperty("MainColor"), Graphics.COLOR_TRANSPARENT);
		dc.drawText(120, 90, Graphics.FONT_LARGE, "Hello World!", Graphics.TEXT_JUSTIFY_CENTER);
		
		 // Get the current time and format it correctly
        var timeFormat = "$1$:$2$:$3$";
        var clockTime = System.getClockTime();
        var hours = clockTime.hour;
        if (!System.getDeviceSettings().is24Hour) {
            if (hours > 12) {
                hours = hours - 12;
            }
        }
        var timeString = Lang.format(timeFormat, [hours, clockTime.min.format("%02d"), clockTime.sec.format("%02d")]);

        // Update the view
        dc.setColor(Application.getApp().getProperty("SecondColor"), Graphics.COLOR_TRANSPARENT);
        dc.drawText(120, 120, Graphics.FONT_LARGE, timeString, Graphics.TEXT_JUSTIFY_CENTER);
		
        dc.clear();
    }
}