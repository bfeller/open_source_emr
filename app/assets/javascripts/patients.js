function search_patients() {
  var value = $("#patient_search").val();
  if (value.length > 2) {
    $.ajax({
      url: '/patients_search',
      type: 'GET',
      data: { search: value },
      success: function(html) {
        //$('#patient_search_list').html(html);
        $('#patient_search_list').html("<h3>Patients</h3>" + html);
      }
    });
  }
};

$('#patient_search').on('keyup', function() {
  search_patients();
});