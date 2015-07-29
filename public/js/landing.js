function toggleScroll() {
  $('.start-login, .start-signup').toggleClass('active');
  //$('html, body, .section-start').animate({
  //  scrollTop: 0
  //}, 200);
}

$('.btn-signup, .btn-back-login').click(function() {
  toggleScroll();
});

$('.btn-signup, .btn-back-login').on('touchstart', function(event) {
  event.stopPropagation();
  toggleScroll();
});