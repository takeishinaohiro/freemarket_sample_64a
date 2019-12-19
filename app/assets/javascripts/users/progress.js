$(function() {
  //プログレスバー
  let path = location.pathname;
  switch(path) {
    case '/addresses/new':
      $('.progress__status2').addClass('active');
    break;
    case '/card/new':
      $('.progress__status2').addClass('active');
      $('.progress__status3').addClass('active');
    break;
    case '/users/result':
      $('.progress__status2').addClass('active');
      $('.progress__status3').addClass('active');
      $('.progress__status4').addClass('active');
    break;
  }
});