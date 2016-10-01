//= require jquery
//= require jquery_ujs

$( document ).ready(function() {
  $('.slider').on('slidestop', function(ev) {
    updateControlState($(this));
  });

  $('.select').on('change', function(ev) {
    updateControlState($(this));
  });

  $('.button').on('click', function() {
    var apiVerb = $(this).data('api-verb');
    var apiEndpoint = $(this).data('api-endpoint');

    console.log(apiVerb);
    console.log(apiEndpoint);

    $.ajax({
      type: apiVerb,
      url: apiEndpoint,
      data: {},
      dataType: 'json',
      timeout: 5000,
      success: function(msg) {
        openPopup('#success-popup');
        console.log('Data send: ' + msg);
      },
      error: function(jqXHR, status, error) {
        openPopup('#alert-popup');
        console.log('Error: ' + status + ' ' +error);
      }
    });

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
        console.log('Data Saved: ' + msg);
      },
      error: function(jqXHR, status, error) {
        openPopup('#alert-popup');
        console.log('Error: ' + status + ' ' +error);
      }
    });
  };

  function openPopup(elem) {
    $(elem).show();
    $(elem).popup();
    $(elem).popup('open');
  }
});
