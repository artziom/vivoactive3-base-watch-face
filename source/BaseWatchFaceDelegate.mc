using Toybox.WatchUi;
using Toybox.Time;
using Toybox.Time.Gregorian;
using Toybox.System;
using Toybox.Lang;

class BaseWatchFaceDelegate extends WatchUi.WatchFaceDelegate{
	function initialize() {
        WatchFaceDelegate.initialize();
    }

	function onPowerBudgetExceeded(powerInfo){
    	var today = Gregorian.info(Time.now(), Time.FORMAT_MEDIUM);
		var dateString = Lang.format(
		    "$1$:$2$:$3$ $4$ $5$ $6$ $7$",
		    [
		        today.hour,
		        today.min,
		        today.sec,
		        today.day_of_week,
		        today.day,
		        today.month,
		        today.year
		    ]
		);
        System.println("BaseWatchFaceDelegate.onPowerBudgetExceeded() | " + dateString);
        System.println("powerInfo.executionTimeAverage: " + powerInfo.executionTimeAverage);
        System.println("powerInfo.executionTimeLimit: " + powerInfo.executionTimeLimit);    
	}
}