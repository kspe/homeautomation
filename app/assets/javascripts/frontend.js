//= require jquery
//= require jquery_ujs

$( document ).ready(function() {
  $('.slider').on('slidestop', function(ev) {
    updateControlState($(this));
  });

  $('.select').on('change', function(ev) {
    updateControlState($(this));
  });

  function updateControlState(elem) {
    var form = elem.closest('form');
    var formData = form.serialize();

    $.ajax({
      type: "PUT",
      url: form.attr('action'),
      data: formData,
      dataType: 'json',
      timeout: 5000,
      success: function(msg) {
        console.log( "Data Saved: " + msg );
      },
      error: function(jqXHR, status, error) {
        $('#alert-popup').show();
        $('#alert-popup').popup();
        $('#alert-popup').popup('open');
        console.log('Error: ' + status + ' ' +error);
      }
    });
  }
});
