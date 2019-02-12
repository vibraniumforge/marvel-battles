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
        this.movieName = obj.movie.name
        this.movieYear = obj.movie.year
        this.characterName = obj.character.name
        this.id = obj.id;
    }
}

Battle.prototype.battleHTML = function (){
    return (`
        <tr>
            <td><a href="/battles/${this.id}">${this.name}<a></td>
            <td><a href="/battles/${this.id}">${this.location}<a></td>
            <td><a href="/battles/${this.id}">${this.movieName}<a></td>
            <td><a href="/battles/${this.id}">${this.movieYear}<a></td>
            <td><a href="/battles/${this.id}">${this.characterName}<a></td>
        <tr>    
    `)
}

///////////////////Characters

function charactersListener() {
    $("#characters-index").on("click", function(event) {
        event.preventDefault();
        getCharacters();
    })
}

function getCharacters() {
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
        this.superpowers = superpowersFx(obj.superpowers)
        this.id = obj.id
    }
    static newCharacterForm(){
        return (`
            <div>
                <form>           
                    <input type="text" id="name" placeholder="name"/>
                    <input type="text" id="alias" placeholder ="alias"/>  
                    <button type="button" id="js-btn">Submit</button>
                </form>
            </div>
        `)
    }
}

function superpowersFx(objSuperpowers) {
    let superpowers = [];
    objSuperpowers.map(os=> {
        superpowers.push(' '+os.name);
    })
    return superpowers;
}

Character.prototype.characterHTML = function (){
    return (`
        <tr>
            <td><a href="/characters/${this.id}">${this.name}<a></td>
            <td><a href="/characters/${this.id}">${this.alias}<a></td>
            <td><a href="/characters/${this.id}">${this.superpowers}<a></td>
        <tr>    
    `)
}

function getNewCharacterForm() {
    $("#js-btn").on("click", function (event) {
        event.preventDefault();
        let form = Character.newCharacterForm();
        $("#js-form").append(form);
    })
}

function postToCharacters() {
    $('form').submit(function(event) {
      event.preventDefault();
      var values = $(this).serialize();
      var posting = $.post('/characters', values);
      $("#json-characters-table").html('');
      getCharacters();
    });
  }

