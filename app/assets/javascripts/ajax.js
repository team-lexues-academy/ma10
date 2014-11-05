var cnt = 0;

$(function() {
  $('.karuta').click(function() {
    $('#question-karuta').load('karuta.html');
    if(cnt == 6){
      alert('終わりです');
    }else{
      cnt = cnt + 1;
    }
  });
});
