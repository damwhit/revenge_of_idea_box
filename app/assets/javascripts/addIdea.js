$(document).ready(function(){

$( "#newIdea" ).submit(function( event ) {
  console.log(event)
  
  event.preventDefault();

  var $form = $( this ),
    titleVal = $form.find( "input#title" ).val(),
    bodyVal = $form.find( "input#body" ).val(),
    url = $form.attr( "action" );

  var posting = $.post( url, { title: titleVal, body: bodyVal } ).then(function(idea) {
    $('#tbody').prepend('<tr><td><h3 class="title">'
                        + idea.title +
                        '</h3></td><td><h3 class="body">'
                        + idea.body +
                        '</h3></td><td class="quality"><h3>'
                        + idea.quality +
                        '</h3></td><td><h3><a class="delete btn btn-danger" data-id='
                        + idea.id +
                        ' id=delete' + idea.id + '>'
                        + 'delete' +
                        '</a></h3></td><td><h3><a class="change btn btn-success" data-id='
                        + idea.id +
                        ' data-q=' + idea.quality +
                        ' data-change=up' +
                        ' id=up' + idea.id + '>'
                        + 'thumbs up' +
                        '</a></h3></td><td><h3><a class="change btn btn-warning" data-id='
                        + idea.id +
                        ' data-q=' + idea.quality +
                        ' data-change=down' +
                        ' id=down' + idea.id + '>'
                        + 'thumbs down' +
                        '</a></h3></td></tr>'
                      )
    $('#newIdea')[0].reset()
  })
});

});
