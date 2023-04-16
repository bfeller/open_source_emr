function addMinutes(date, minutes) {
    return new Date(date.getTime() + minutes*60000);
}


$('.calendar_wrapper').ready(function() {
  if($('#calendar').length > 0) {
    var dp = new DayPilot.Calendar("dp");

    // view
    dp.startDate = "2022-06-24";
    dp.viewType = "Resources";
    $.ajax({
      url: "/calendar_columns",
      type: "GET",
      dataType: "json",
      success: function(data) {
        dp.columns.list = data;
        console.log(data);
        dp.init();
        $.ajax({
          url: "/appointments",
          type: "GET",
          dataType: "json",
          success: function(data) {
            dp.events.list = data;
            dp.update();
          }
        })
        dp.events.add({
            start: "2022-06-24T12:00:00",
            end: "2022-06-24T15:00:00",
            resource: "B",
            id: DayPilot.guid(),
            text: "Room reservation"
        });
      }
    });
    // event creating
    dp.onTimeRangeSelected = function (args) {
      console.log(args);
      window.location.href = "/appointments/new?start_time=" + args.start + "&end_time=" + args.end + "&user_id=" + args.resource;
        //var e = new DayPilot.Event({
        //    start: args.start,
        //    end: args.end,  
        //    resource: args.resource,
        //    id: DayPilot.guid(),
        //    text: name
        //});
        //dp.events.add(e);
        dp.clearSelection();
    };
  };

});