$(function() {
    console.log('ausv');
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
  $('.mypage-tab').click(function(){
      $('.is-active').removeClass('is-active');
      $(this).addClass('is-active');
      $('.is-show').removeClass('is-show');
      // クリックしたタブからインデックス番号を取得
      const index = $(this).index();
      // クリックしたタブと同じインデックス番号をもつコンテンツを表示
      $('.mypage__middle--content').eq(index).addClass('is-show');
  });
});