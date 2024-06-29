$(document).on('turbolinks:load', function() {
    setTimeout(function() {
        $('.alert').fadeOut('slow');
    }, 2000); // Adjust the time as needed
});
  