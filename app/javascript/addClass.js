$(window).on("scroll",(function(){
  if ($(window).scrollTop() > 0) {
    $('.header').addClass('fixedHeader');
  } else {
    $('.header').removeClass('fixedHeader');
  }
}));