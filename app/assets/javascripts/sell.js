$(function() {
  let images = [];

  function buildHTML(imgSrc) {
    let html = `<div class="preview-box">
                  <div class="preview-box__img-box">
                    <img src="${imgSrc}">
                  </div>
                  <div class="preview-box__select">
                    <div class="preview-box__select--edit">
                      <p>編集</p>
                    </div>
                    <div class="preview-box__select--delete">
                      <p>削除</p>
                    </div>
                  </div>
                </div>`
    $('.drop-zone').prepend(html);
  };

  $('#sell-img').change(function(e) {
    let files = e.target.files;
    for (var i = 0, f; f = files[i]; i++) {
      let reader = new FileReader();
      reader.readAsDataURL(f);
      reader.onload = function() {
      let imgSrc = reader.result;
      buildHTML(imgSrc);
      images.push(imgSrc);
      console.log(images);
    }
    }
  });

  // 画像のドロップ時、ドロップした画像の数だけプレビューを追加する
  $('.sell-box__img--input').on('drop', function(e) {
    e.preventDefault();
    e.stopPropagation();
    let dropImages = e.originalEvent.dataTransfer.files;
      for(let i = 0; i < dropImages.length; i++ ) {
        let imgSrc = URL.createObjectURL(dropImages[i]);
        buildHTML(imgSrc);
        images.push(dropImages[i].name);
      }
  });

  // ドロップゾーン以外でドロップできないようにする
  $(document).on('drop', function(e) {
    e.stopPropagation();
    e.preventDefault();
  });
  $(document).on('dragenter', function(e) {
    e.stopPropagation();
    e.preventDefault();
  });
  $(document).on('dragover', function(e) {
    e.stopPropagation();
    e.preventDefault();
  });



  // 削除ボタンクリック時、プレビューを削除する
  $(document).on('click', '.preview-box__select--delete p', function(){
    $(this).closest('.preview-box').remove();
  });

  // 販売利益の計算
  $('.price-flex__input').keyup(function() {
    let price = $(this).val();
    if(price > 300) {
      let fee = price * 0.10;
      let resultFee = Math.floor(fee)
      $('.result-fee').text(`${resultFee}円`);

      let profit = price - resultFee;
      $('.result-profit').text(`${profit}円`);
    }
  });


});