// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require bootstrap-sprockets
//= require turbolinks
//= require bootsy
//= require_tree .

$(document).on('turbolinks:load', function() {
  
  $('form').on('change', '.message-type', function() {
    $('.message-block').hide();
    $('.message-block input, .message-block textarea').val('');
    if ($(this).val()) {
      $('.message-block#' + $(this).val()).show();
    }
  });

  $('body').on('submit', '.new_enquiry', function(e) {
    e.preventDefault();
    $.ajax({
      type: "POST",
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      url: $(this).attr('action') + '.json',
      data: $(this).serializeArray(),
      dataType: 'json',
      success: function(responseData, textStatus, jqXHR) {
        console.log("SUCCESS");
      },
      error: function(response) {
        console.log(response.responseJSON);
      }
    });
  });
  
});
