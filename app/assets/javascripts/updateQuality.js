$(document).on('click', '.change', function(event){
  console.log('thumbs up dude')
  event.preventDefault();

  var ideaId = $(this).data('id')
  var ideaQuality = $(this).data('q')
  var ideaChange = $(this).data('change')

  $.ajax({
    url: '/api/v1/ideas/' + ideaId,
    method: "PATCH",
    dataType: 'json',
    data: { quality: ideaQuality,
            change: ideaChange
    }
  }).success(function() {
    console.log('updated')
  })

  $('#tbody').empty()
  getIdeas()

});
