$(function() {
  $('.sidebar__top--item').hover(
    function() {
      $(this).find('.fa-chevron-right').css({'color':'gray', 'transform':'translateX(5px)'});
    },
    function() {
      $(this).find('.fa-chevron-right').css({'color':'lightgray', 'transform':'translateX(0)'});
    }
    );
});
$(function($){
  $('.a').click(function(){
      $('.b').removeClass('is-active');
      $(this).addClass('is-active');
      $('.f').removeClass('is-show');
      // クリックしたタブからインデックス番号を取得
      const index = $(this).index();
      // クリックしたタブと同じインデックス番号をもつコンテンツを表示
      $('.e').addClass('is-show');
  });
});

$(function($){
  $('.b').click(function(){
      $('.a').removeClass('is-active');
      $(this).addClass('is-active');
      $('.e').removeClass('is-show');
      // クリックしたタブからインデックス番号を取得
      const index = $(this).index();
      // クリックしたタブと同じインデックス番号をもつコンテンツを表示
      $('.f').addClass('is-show');
  });
});

$(function($){
  $('.c').click(function(){
      $('.d').removeClass('is-active');
      $(this).addClass('is-active');
      $('.h').removeClass('is-show');
      // クリックしたタブからインデックス番号を取得
      const index = $(this).index();
      // クリックしたタブと同じインデックス番号をもつコンテンツを表示
      $('.g').addClass('is-show');
  });
});

$(function($){
  $('.d').click(function(){
      $('.c').removeClass('is-active');
      $(this).addClass('is-active');
      $('.g').removeClass('is-show');
      // クリックしたタブからインデックス番号を取得
      const index = $(this).index();
      // クリックしたタブと同じインデックス番号をもつコンテンツを表示
      $('.h').addClass('is-show');
  });
});
$(function(){
  $('.slider').slick({
    prevArrow:'<i class="fa fa-angle-left arrow arrow-left"></i>',
    nextArrow:'<i class="fa fa-angle-right arrow arrow-right"></i>',
    dots: true,
    autoplay: true,
    autoplaySpeed: 4000,
    speed: 800
  });

  $('.slick-dots li').on('mouseover', function() {
    $('.slider').slick('goTo', $(this).index());
  });
});


