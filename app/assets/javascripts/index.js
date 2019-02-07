$(function(){
    moviesListener();
})

function getMovies() {
    $.ajax({
        type: "GET",
        url: "/movies",
        dataType: "json"
    })
    .done(function(response) {
        let movies = response.map(item => {
            let movie = new Movie(item);
            let movieHtml = movie.movieHTML();
            $("#json-movies").append(movieHtml);
        });
    });
}

function moviesListener() {
    $("#movies-index").on("click", function(e) {
        e.preventDefault();
        getMovies();
    })
}

class Movie {
    constructor(obj) {
        this.name = obj.name;
        this.year = obj.year;
        this.poster = obj.poster;
        this.id = obj.id
    }
}

Movie.prototype.movieHTML = function (){
    return (`
        <tr>
            <td><a href="/movies/${this.id}">${this.name}<a></td>
            <td><a href="/movies/${this.id}">${this.year}<a></td>
        <tr>    
  
    `)
}