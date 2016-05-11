$( document ).ready(function() {
    console.log( "ready!" );

    $.getJSON( "/api/v1/ideas.json", function( ideas ) {
      ideas.forEach(function(idea) {
        $('#ideas').append( '<tr><td><h3>'
                            + idea.title +
                            '</h3></td><td><h3>'
                            + idea.body +
                            '</h3></td><td><h3>'
                            + idea.quality +
                            '</h3></td><td><h3><a class="delete btn btn-danger" data-id='
                            + idea.id +
                            ' id=delete' + idea.id + '>'
                            + 'delete' +
                            '</a></h3></td><td><h3><a class="up btn btn-success" data-id='
                            + idea.id +
                            ' id=up' + idea.id + '>'
                            + 'thumbs up' +
                            '</a></h3></td><td><h3><a class="down btn btn-warning" data-id='
                            + idea.id +
                            ' id=down' + idea.id + '>'
                            + 'thumbs down' +
                            '</a></h3></td></tr>'
                          )
      })
    });
});
