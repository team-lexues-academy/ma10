$(document).ready(function(){
  $('.karuta').bind("click",function(){
    var elem = $(this);
    if(elem.data('flipped')){
      elem.revertFlip();
      elem.data('flipped',false)
    } else {
      elem.flip({
        direction:'lr',
        speed: 50,
        onBefore: function(){
          elem.html(elem.siblings('.karutaData').html());
        }
      });
      elem.data('flipped',true);
    }
  });
});
