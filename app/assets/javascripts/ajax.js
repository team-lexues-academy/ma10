$(function() {
  var cnt = 0; //cntを初期化
  var answer = Math.round( Math.random()*1 );
  var answer_tag = '#answer' + answer;
  var answer_detail_tag = '#answer-detail' + answer;


  $.post("karuta/doraemon.json",apiCallback);

  function apiCallback(data) {
    var result ='';
    var result2 ='';
    var question='';
    var question_number = 2;
    var number = Math.round( Math.random()*8 );
    var next_number = number + 1;

    for(i=0; i<2; i++ ){
      result += '<td>';
      if (answer == i ) {
        $(answer_tag).append(data[number][1]);
        $(answer_detail_tag).append(data[number][2]);
      } else {
        var other_answer_tag = '#answer' + i;
        var other_answer_detail_tag = '#answer-detail' + i;
        $(other_answer_tag).append(data[next_number][1]);
        $(other_answer_detail_tag).append('残念＼(^o^)／');
      }
    }
    question += data[number][0];

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

    $("#result2").append(result2);
    $("#quetioin-area").append(question);
  }

  $(answer_tag).click(function() {
      alert('正解');
      setTimeout(function(){
        $("#quetioin-area").empty();
        $(".karuta").empty();
        $(".karutaData").empty();
        $.post("karuta/doraemon.json",apiCallback);
        cnt = cnt + 1;  //cntが6でなければインクリメント
      },2000);
  });

  $('.karuta').click(function() {
    if(cnt == 6){ //もしcntが6だったら
      $(location).attr('href', '/karuta/index.html');
    }
  });
});
