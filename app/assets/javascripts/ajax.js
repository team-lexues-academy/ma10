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

var result ='';
$.post("karuta/doraemon.json",
  function(data){
    result += '<table>';
    result += '<tr>';
    result += '<td>';
    result += '<div class="karuta"><%= @answer %></div>';
    result += '<div class="karutaData"><%= @answer_detail %></div>';
    result += '</td>';
    result += '<td>';
    result += '<div class="karuta">甘酸っぱい<%= image_tag("flip.png") %></div>';
    result += '<div class="karutaData">え？<img src="wrong.png"></div>';
    result += '</td>';
    result += '</tr>';
    result += '</table>';
    result += data;

    console.log(data);
    console.log(result);
    $("#result").append(result);
  }
);
