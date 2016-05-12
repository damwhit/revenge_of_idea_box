$(document).on('click', '.change', function(event){
  event.preventDefault();

  var ideaId = $(this).data('id')
  var ideaChange = $(this).data('change')
  var qualityHeading = $(this).parent('h3').parent('td').siblings('.quality').children('h3')

  var qualityText = $(this).parent('h3').parent('td').siblings('.quality').children('h3').text()

  var upVote = {genius: "genius", plausible: "genius", swill: "plausible"}
  var downVote = {swill: "swill", plausible: "swill", genius: "plausible"}

  if (ideaChange == 'up') {
    qualityHeading.empty().html(upVote[qualityText])
    $.ajax({
      url: '/api/v1/ideas/' + ideaId,
      method: "PATCH",
      dataType: 'json',
      data: { quality: upVote[qualityText]
      }
    }).success(function() {
      console.log('updated')
    })
  };

  if (ideaChange == 'down') {
    qualityHeading.empty().html(downVote[qualityText])
    $.ajax({
      url: '/api/v1/ideas/' + ideaId,
      method: "PATCH",
      dataType: 'json',
      data: { quality: downVote[qualityText]
      }
    }).success(function() {
      console.log('updated')
    })
  }
});
