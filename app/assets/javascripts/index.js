$(function(){
    moviesListener();
    battlesListener();
    charactersListener();
})

function moviesListener() {
    $("#movies-index").on("click", function(e) {
        e.preventDefault();
        getMovies();
    })
}

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
            $("#json-movies-table").append(movieHtml);
        });
    });
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

///////////////////////Battles

function battlesListener() {
    $("#battles-index").on("click", function(e) {
        e.preventDefault();
        getBattles();
    })
}

function getBattles() {
    $.ajax({
        type: "GET",
        url: "/battles",
        dataType: "json"
    })
    .done(function(response) {
        let battles = response.map(item => {
            let battle = new Battle(item);
            let battleHtml = battle.battleHTML();
            $("#json-battles-table").append(battleHtml);
        });
    });
}

class Battle {
    constructor(obj) {
        this.name = obj.name;
        this.location = obj.location;
        this.character_id = obj.character_id;
        this.movie_id = obj.movie_id;
        this.id = obj.id
    }
}

Battle.prototype.battleHTML = function (){
    return (`
        <tr>
            <td><a href="/battles/${this.id}">${this.name}<a></td>
            <td><a href="/battles/${this.id}">${this.location}<a></td>
        <tr>    
    `)
}

///////////////////Characters

function charactersListener() {
    $("#characters-index").on("click", function(e) {
        e.preventDefault();
        getCharacters();
    })
}

function getCharacters() {
    console.log("getCharacters fires");
    $.ajax({
        type: "GET",
        url: "/characters",
        dataType: "json"
    })
    .done(function(response) {
        let characters = response.map(item => {
            let character = new Character(item);
            let characterHtml = character.characterHTML();
            $("#json-characters-table").append(characterHtml);
        });
    });
}

class Character {
    constructor(obj) {
        this.name = obj.name;
        this.alias = obj.alias;
        this.id = obj.id
    }
}

Character.prototype.characterHTML = function (){
    return (`
        <tr>
            <td><a href="/characters/${this.id}">${this.name}<a></td>
            <td><a href="/characters/${this.id}">${this.alias}<a></td>
        <tr>    
    `)
}
