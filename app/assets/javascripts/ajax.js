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
var result2 ='';
var question='';

$.post("karuta/doraemon.json",
  function(data){
    result += '<table>';
    result += '<tr>';
    result += '<td>';
    result += '<div class="karuta">' + data["0"][1] + '</div>';
    result += '<div class="karutaData">' + data["0"][2] + '</div>';
    result += '</td>';
    result += '<td>';
    result += '<div class="karuta">甘酸っぱい</div>';
    result += '<div class="karutaData">え？</div>';
    result += '</td>';
    result += '</tr>';
    result += '</table>';
    question += data["0"][0];

    result2 += '<table>';
    result2 += '<tr>';
    result2 += '<td>';
    result2 += '<div class="karuta">' + data["0"][1] + '</div>';
    result2 += '<div class="karutaData">' + data["0"][2] + '</div>';
    result2 += '</td>';
    result2 += '<td>';
    result2 += '<div class="karuta">甘酸っぱい</div>';
    result2 += '<div class="karutaData">え？</div>';
    result2 += '</td>';
    result2 += '<td>';
    result2 += '<div class="karuta">おおむね赤</div>';
    result2 += '<div class="karutaData">え？</div>';
    result2 += '</td>';
    result2 += '</tr>';
    result2 += '<tr>';
    result2 += '<td>';
    result2 += '<div class="karuta">' + data["0"][1] + '</div>';
    result2 += '<div class="karutaData">' + data["0"][2] + '</div>';
    result2 += '</td>';
    result2 += '<td>';
    result2 += '<div class="karuta">甘酸っぱい</div>';
    result2 += '<div class="karutaData">え？</div>';
    result2 += '</td>';
    result2 += '<td>';
    result2 += '<div class="karuta">おおむね赤</div>';
    result2 += '<div class="karutaData">え？</div>';
    result2 += '</td>';
    result2 += '</tr>';
    result2 += '</table>';

    console.log(data);
    console.log(result);
    $("#result").append(result);
    $("#result2").append(result2);
    $("#quetioin-area").append(question);

  }
);
