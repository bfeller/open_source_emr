
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

function toggle_edit_note(note_id){
  $('#note_show_box_'+note_id).toggle();
  $('#note_edit_box_'+note_id).toggle();
}