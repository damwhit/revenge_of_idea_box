$(document).on('click', '.title', function(event) {
  $(this).attr('contentEditable', 'true');

  $(this).on('blur keydown', function(e){
    var titleText = this.textContent
    var ideaId = $(this).data('id')
    var key = e.which

    if (key == 13) {
      e.preventDefault()
      $('.title').blur()
    }

    if (key == 13 || e.type == 'blur') {

      $.ajax({
        url: '/api/v1/ideas/' + ideaId,
        method: "PATCH",
        dataType: 'json',
        data: { title: titleText }
      }).success(function(data) {
        console.log('updated')
      })
    }
  })
});

$(document).on('click', '.body', function(event) {

  $(this).attr('contentEditable', 'true');
  $(this).on('blur keydown', function(e){

    var bodyText = this.textContent
    var ideaId = $(this).data('id')
    var key = e.which

    if (key == 13) {
      e.preventDefault()
      $('.body').blur()
    }

    if (key == 13 || e.type == 'blur') {

      $.ajax({
        url: '/api/v1/ideas/' + ideaId,
        method: "PATCH",
        dataType: 'json',
        data: { body: bodyText }
      }).success(function(data) {
        console.log('updated')
      })
    }
  })
});
