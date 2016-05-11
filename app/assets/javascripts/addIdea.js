$(document).ready(function(){

$( "#newIdea" ).submit(function( event ) {
  console.log(event)
  event.preventDefault();

  var $form = $( this ),
    titleVal = $form.find( "input#title" ).val(),
    bodyVal = $form.find( "input#body" ).val(),
    url = $form.attr( "action" );

  var posting = $.post( url, { title: titleVal, body: bodyVal } ).then(function(idea) {
    $('#tbody').prepend( '<tr><td><h3>'
                        + idea.title +
                        '</h3></td><td><h3>'
                        + idea.body +
                        '</h3></td><td><h3>'
                        + idea.quality +
                        '</h3></td></tr>'
                      )
    $('#newIdea')[0].reset()
  })
});

});
