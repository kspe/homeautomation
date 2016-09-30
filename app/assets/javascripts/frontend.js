//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require vue

var API_ENDPOINT = 'http://admin.kalm.pl'

window.onload = function () {
  var devices = new Vue({
    el: '#devices',
    data: {
      devices: []
    },
    ready: function() {
      var that;
      that = this;
      $.ajax({
        url: API_ENDPOINT + '/devices.json',
        success: function(res) {
          that.devices = res;
        }
      });
    }
  });
};
