using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.Application;

class BaseWatchFaceView extends WatchUi.WatchFace {

	private var timeWidget;

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.WatchFace(dc));
        
        timeWidget = View.findDrawableById("TimeWidget");
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {    
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }
    
    function onPartialUpdate(dc){
    	if(System.getClockTime().sec % 5 == 0){    	
			timeWidget.drawWidget(dc, true);
		}
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {
    }

}
