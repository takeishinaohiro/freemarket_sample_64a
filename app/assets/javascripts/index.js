$(function() {
  $('.header__menu-right__mypage').hover(
    function() {
        
        //マウスカーソルが重なった時の処理
        $('.header__menu-right__mypage').css('background-color', '#00f');
        
    },
    function() {
        
        //マウスカーソルが離れた時の処理
        $('.header__menu-right__mypage').css('background-color', '#f00');
        
    }
);
});