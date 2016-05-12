$(document).on('click', '.delete', function(event) {
  event.preventDefault();

  var ideaId = $(this).data('id')

  $.ajax({
    url: '/api/v1/ideas/' + ideaId,
    method: "DELETE",
    dataType: 'json'
  }).success(function() {
    console.log('deleted')
  });
  $(this).parent('h3').parent('td').parent('tr').hide()
});
