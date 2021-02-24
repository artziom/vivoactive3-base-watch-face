using Toybox.WatchUi;
using Toybox.Application;
using Toybox.Graphics;

using Toybox.System;
using Toybox.Lang;
using Toybox.Time;
using Toybox.Time.Gregorian;

class DateWidget extends WatchUi.Drawable {

	private var currentDayOfWeek, dayOfWeekString, currentMonth, monthString;

	function initialize(params){
		Drawable.initialize(params);
	}

	function draw(dc){		
		var dateString = updateDate();
        
        dc.setColor(Application.getApp().getProperty("SecondColor"), Graphics.COLOR_TRANSPARENT);
        dc.drawText(120, 120, Graphics.FONT_LARGE, dateString, Graphics.TEXT_JUSTIFY_CENTER);
		
        dc.clear();
    }
    
    function updateDate(){
		var now = Gregorian.info(Time.now(), Time.FORMAT_SHORT);
		var day = now.day.format("%02d");
				
		var rezStrings = Rez.Strings;
		var resourceArray;
		
		var dayOfWeekSample = now.day_of_week;		
		if(dayOfWeekSample != currentDayOfWeek){
			currentDayOfWeek = dayOfWeekSample;
			
			resourceArray = [
				rezStrings.Sun,
				rezStrings.Mon,
				rezStrings.Tue,
				rezStrings.Wed,
				rezStrings.Thu,
				rezStrings.Fri,
				rezStrings.Sat
			];
			
			dayOfWeekString = WatchUi.loadResource(resourceArray[currentDayOfWeek - 1]).toUpper();
		} 
			
		
		var monthSample = now.month;
		if(monthSample != currentMonth){
			currentMonth = monthSample;
			
			resourceArray = [
				rezStrings.Jan,
				rezStrings.Feb,
				rezStrings.Mar,
				rezStrings.Apr,
				rezStrings.May,
				rezStrings.Jun,
				rezStrings.Jul,
				rezStrings.Aug,
				rezStrings.Sep,
				rezStrings.Oct,
				rezStrings.Nov,
				rezStrings.Dec
			];
			
			monthString = WatchUi.loadResource(resourceArray[currentMonth - 1]).toUpper();
		}
		
		var year = now.year;
		
		return Lang.format("$1$ $2$ $3$\n$4$", [dayOfWeekString, day, monthString, year]);
	}
}