$(function() {
    console.log('ausv');
  $('.header__menu-right__mypage').hover(
    function() {
        //マウスカーソルが重なった時の処理
        $('.my-menu').css('display', 'block');
    },
    function() {
        //マウスカーソルが離れた時の処理
        $('.my-menu').css('display', 'none');
    }
    );
});
