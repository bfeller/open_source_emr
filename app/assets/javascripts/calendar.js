function addMinutes(date, minutes) {
    return new Date(date.getTime() + minutes*60000);
}


$('.calendar_wrapper').ready(function() {
  if($('#calendar').length > 0) {
    init_calendar();
  };
});
function init_calendar(){
  var tdate = $('.cal_today_date').val();
  var dp = new DayPilot.Calendar("dp");

  // view
  dp.startDate = tdate
  dp.viewType = "Resources";
  $.ajax({
    url: "/calendar_columns",
    type: "GET",
    dataType: "json",
    success: function(data) {
      dp.columns.list = data;
      dp.init();
      $.ajax({
        url: "/appointments",
        type: "GET",
        data: {
          start: dp.visibleStart().toString(),
          end: dp.visibleEnd().toString()
        },
        dataType: "json",
        success: function(data) {
          dp.events.list = data;
          dp.update();
        }
      })
    }
  });
  // event creating
  dp.onTimeRangeSelected = function (args) {
    console.log(args);
    window.location.href = "/appointments/new?start_time=" + args.start + "&end_time=" + args.end + "&user_id=" + args.resource;
    dp.clearSelection();
  };
  dp.onEventMoved = function (args) {
    $.ajax({
      url: "/appointments/" + args.e.id(),
      type: "PATCH",
      dataType: "json",
      data: {
        appointment: {
          start_time: args.newStart.toString(),
          end_time: args.newEnd.toString(),
          user_id: args.newResource
        }
      },
      success: function(data) {
        dp.update();
      }
    })
  }
  dp.onEventClick = function (args) {
    window.location.href = "/appointments/" + args.e.id() + "/edit";
  }
}