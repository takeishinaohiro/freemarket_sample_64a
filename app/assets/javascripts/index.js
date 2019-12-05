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
