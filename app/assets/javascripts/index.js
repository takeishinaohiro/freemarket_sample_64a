$(function(){
$('.carousel__right-btn').click(function(){
  $('.image2').removeClass('none')
  $('.image1').addClass('none')
})
$('.carousel__left-btn').click(function(){
  $('.image2').removeClass('none')
  $('.image1').addClass('none')
})
$('.image2__left-btn').click(function(){
  $('.image1').removeClass('none')
  $('.image2').addClass('none')
})
$('.image2__right-btn').click(function(){
  $('.image1').removeClass('none')
  $('.image2').addClass('none')
})
})

