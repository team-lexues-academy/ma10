var cnt = 0; //cntを初期化

$(function() {
  $('.karuta').click(function() {
    $('#question-karuta').load('karuta.html');
    if(cnt == 6){ //もしcntが6だったら
      alert('終わりです'); //ここでアラートを出したい
    }else{
      cnt = cnt + 1;  //cntが6でなければインクリメント
    }
  });
});
