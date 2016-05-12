$(document).ready(function(){

  $( "#searchIdeas" ).submit(function( event ) {
    event.preventDefault()

  });

  $('#search').on('keyup', function(event){
    var searchTerm = $(this).val()

    $.getJSON( "/api/v1/ideas.json?search=" + searchTerm, function( ideas ) {
        $('#tbody').empty()
      ideas.forEach(function(idea) {
        $('#tbody').append( '<tr><td><h3 class="title" data-id='
                            + idea.id + '>'
                            + idea.title +
                            '</h3></td><td><h3 class="body" data-id='
                            + idea.id + '>'
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
      })
    });
  })
});
