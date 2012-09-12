package com.polyworks.utils
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;
    import flash.text.TextFormat;
    
    public class Calendar extends MovieClip
	{
        var calendar:MovieClip = new MovieClip();
        var monthsOfYear:Array = new Array("January", "February", "March", "April", "May", "June", "July", "August", "September", "Octomber", "November", "December");
        var daysOfWeek:Array = new Array("Sunday", "Monday", "Tuesday", "Wennesday", "Thursday", "Friday", "Saturday");
        var daysOfMonths:Array = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
        var currentDate:Date = new Date();
        var myDate:Date = new Date(currentDate.getFullYear(), currentDate.getMonth(), 1);//provided by Andrei Firoiu
        var month_mc:MovieClip = new MovieClip();
        var day_mc:MovieClip;
        var days_mc:MovieClip = new MovieClip();
        var daysNo:Number;
        var startDay:Number;
        var i:Number;
        
        public function Calendar()
		{
            publishMonth();
            publishDays();
            
            calendar.x = 20;
            calendar.y = 20;
            addChild(calendar);
        }
        
        public function publishMonth()
		{
            var month_txt:TextField = new TextField();
            month_txt.text = monthsOfYear[currentDate.getMonth()] + " " + currentDate.fullYear;
            month_txt.autoSize = TextFieldAutoSize.LEFT; 
            
            var month_tf = new TextFormat();
            month_tf.font = "Verdana";
            month_tf.color = 0x000000;
            month_tf.size = 20;
            month_txt.setTextFormat(month_tf);month_mc.x = 30;
            month_mc.y = 0;
            month_mc.addChild(month_txt);
            calendar.addChild(month_mc);
        }
        
        public function publishDays()
		{
            daysNo = (currentDate.getFullYear()%4 == 0 && currentDate.getMonth() == 1 ? 29 : daysOfMonths[currentDate.getMonth()]);//provided by Andrei Firoiu
            startDay = myDate.getDay();
            var row:Number = 0;
            
            for (i = 1; i < daysNo+1; i++)
			{
                day_mc = new MovieClip();
                day_mc.name = "days"+i;
                days_mc.addChild(day_mc);
                //provided by Andrei Firoiu\\
                day_mc.x = startDay*25;
                day_mc.y = (row+1)*20;
                loadDays();
                startDay++;
                if(startDay >= 7)
				{
                    startDay = 0;
                    row++;
                }
                ////////////////////////////
            }
            days_mc.x = -80;
            days_mc.y = 20;
            calendar.addChild(days_mc);
        }
        
        public function loadDays()
		{
            var dayLabel:String = i.toString();
            var holder:MovieClip = new MovieClip();
            holder.name = dayLabel;
            day_mc.addChild(holder);
            
            var label_txt:TextField = new TextField();
            label_txt.name = dayLabel+"_txt";
            label_txt.autoSize = TextFieldAutoSize.RIGHT;
            label_txt.text = dayLabel;
            label_txt.mouseEnabled = false;
            
            var day_tf = new TextFormat();
            day_tf.font = "Verdana";
            day_tf.color = 0x000000;
            day_tf.size = 15;
            label_txt.setTextFormat(day_tf);
            holder.addChild(label_txt);
        }
    }
}