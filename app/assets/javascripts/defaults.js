$.fn.select2.defaults.set( "theme", "bootstrap" );

$(document).ready(function() {
  $('.select2').each(function() {
    $(this).select2();
  });
  
});
$.ajaxSetup({
  headers: {
    'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
  }
});