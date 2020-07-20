(function($) {
$(function() {
  var offset = 100;
  var duration = 500;
  $(window).scroll(function() {
  if ($(this).scrollTop() > offset) {
  $('.pagetop').fadeIn(duration);
  } else {
  $('.pagetop').fadeOut(duration);
  }
  });
  
  $('.pagetop').click(function(event) {
  event.preventDefault();
  $('html, body').animate({scrollTop: 0}, duration);
  return false;
  })
})
})(jQuery);