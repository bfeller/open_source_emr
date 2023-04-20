
$('#patient_search').on('keyup', function() {
  search_patients();
  $('#patient_search_list').html("");
});
function search_patients() {
  var value = $("#patient_search").val();
  if (value.length > 2) {
    $.ajax({
      url: '/patients_search',
      type: 'GET',
      
      data: { query: value },
      success: function(html) {
        //$('#patient_search_list').html(html);
        $('#patient_search_list').html(html);
      }
    });
  }
};
$(document).ready(function() {
  $('.toggler').click(function() {
    var hide = $(this).attr('data-hide');
    var show = $(this).attr('data-show');
    $(hide).hide();
    $(show).show();
  });
});