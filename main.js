function cardbAlert(message) {
  $('.cardb-alert').removeClass('d-none');
  $('.cardb-alert').append('<div>' + message + '</div>');
  setTimeout(function () {
    $('.cardb-alert').addClass('d-none');
    $('.cardb-alert > div').remove();
  }, 4000);
}

// Navbar shrink (bug)
$(document).ready(function() {
	$(window).scroll(function() {
  	if($(document).scrollTop() > 10) {
    	$('.navbar').addClass('shrink');
    }
    else {
    $('.navbar').removeClass('shrink');
    }
  });
});

$('.cardb-bet > input').on('input', function() {
  var input = $(this).val() * $('.cardb-final-odd').text();
  $('.cardb-possible-win').text(Math.round(input * 100) / 100);  
});

$('.cardb-final-odd').bind('DOMSubtreeModified', function() {
  var input = $('.cardb-bet > input').val() * $('.cardb-final-odd').text();
  $('.cardb-possible-win').text(Math.round(input * 100) / 100);
});

$('.odds-item').click(function() {
  var oddId = $(this).attr('id');
  $.post('../bet-request.php', {id: oddId}, function(data) {
    if (data == 1) {
      cardbAlert('Only 1');
    } else if (data == 0) {
      cardbAlert('Max 5!');
    } else {
      $('.cardb-items-end').before(data);
      $('#'+oddId).addClass('odds-item-selected');
    }
  });
});

$('.card-item-more > i').click(function() {
  var tempId = $(this).attr('tempid');
  // $.post('../odd-item-cancel.php', {id: tempId}, function(data){
  //   $('.cardb-item').attr('tempid', tempId).html(data);
  // });
  $.post('../odd-item-cancel.php', {id: tempId}, function(data) {
    $('.cardb').append(data);
  });
  $(this).parents('.cardb-item').addClass('d-none');
});