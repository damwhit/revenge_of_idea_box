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
                            '</h3></td></tr>'
                          )
      })
    });
});