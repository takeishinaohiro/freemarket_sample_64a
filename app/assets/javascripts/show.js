$(function() {
  // 詳細ページのslick上
  $('.imagemain').slick({
    slidesToShow: 1,
    slidesToScroll: 1,
    arrows: false,
    fade: true,
  asNavFor: '.imagesab'
  });

    // 詳細ページのslick下
  $('.imagesab').slick({
    slidesToShow: 3,
    slidesToScroll: 1,
    asNavFor: '.imagemain',
    dots: true,
    centerMode: true,
    focusOnSelect: true
  });
})


$(function() {
  // 写真のopacity
  $('.imagesab-a').click(function(){
    console.log("apa");
    $('.imagesab-b').addClass('none')
    $('.imagesab-c').addClass('none')   
    $('.imagesab-d').addClass('none')
    $('.imagesab-a').removeClass('none')
  })

  $('.imagesab-b').click(function(){
    console.log("apa");
    $('.imagesab-a').addClass('none')
    $('.imagesab-c').addClass('none')   
    $('.imagesab-d').addClass('none')
    $('.imagesab-b').removeClass('none')
  })
  $('.imagesab-c').click(function(){
    console.log("apa");
    $('.imagesab-a').addClass('none')
    $('.imagesab-b').addClass('none')   
    $('.imagesab-d').addClass('none')
    $('.imagesab-c').removeClass('none')
  })
  $('.imagesab-d').click(function(){
    console.log("apa");
    $('.imagesab-a').addClass('none')
    $('.imagesab-b').addClass('none')   
    $('.imagesab-c').addClass('none')
    $('.imagesab-d').removeClass('none')
  })

});