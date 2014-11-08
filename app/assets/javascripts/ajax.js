$(function() {
  var cnt = 0; //cntを初期化
  var answer = Math.round( Math.random()*1 );
  var answer_tag = '#answer' + answer;


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
        $(answer_tag).append(data["0"][1]);
      } else {
        var other_answer_tag = '#answer' + i;
        $(other_answer_tag).append(data["1"][1]);
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
      $("#quetioin-area").empty();
      $("#answer0").empty();
      $("#answer1").empty();
      $.post("karuta/doraemon.json",apiCallback);
      cnt = cnt + 1;  //cntが6でなければインクリメント
  });

  $('.karuta').click(function() {
    if(cnt == 6){ //もしcntが6だったら
      $(location).attr('href', '/karuta/index.html');
    }
  });
});
