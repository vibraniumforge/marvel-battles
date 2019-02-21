$(function() {
  moviesListener();
  battlesListener();
  charactersListener();
});

function moviesListener() {
  $("#movies-index-btn").on("click", function(e) {
    e.preventDefault();
    getMovies();
  });
  $("#movies-index-sorted-btn").on("click", function(e) {
    e.preventDefault();
    getSortedMovies();
  });
  $("#movie-show-one-btn").on("click", function(e) {
    e.preventDefault();
    getMovie();
  });
  getNewMovieForm();
}

function getSortedMovies() {
  $.ajax({
    type: "GET",
    url: "/movies",
    dataType: "json"
  })
    .done(function(response) {
      response.sort(function(a, b) {
        if (a.year !== b.year) {
          return a.year - b.year;
        }
        return a.name.toUpperCase() > b.name.toUpperCase();
      });
      let movies = response.map(item => {
        let movie = new Movie(item);
        let movieHtml = movie.movieHTML();
        $("#json-movies-table-sorted").append(movieHtml);
      });
    })
    .fail(function() {
      console.log("getSortedMovies to GET/movies failed");
    });
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
    })
    .fail(function() {
      console.log("getMovies to GET /moviesfailed");
    });
}

function getMovie() {
  $.ajax({
    type: "GET",
    url: "/movies/1",
    dataType: "json",
    cache: false
  })
    .done(function(response) {
      let movie = new Movie(response);
      let movieHtml = movie.movieHTML();
      $("#json-movies-table-first").append(movieHtml);
    })
    .fail(function() {
      console.log("getMovie GET /movies/:id failed");
    });
}

class Movie {
  constructor(obj) {
    this.name = obj.name;
    this.year = obj.year;
    this.poster = obj.poster;
    this.id = obj.id;
  }
  static newMovieForm() {
    return `
      <div>
          <form id="new-movie-form-js">           
              <input type="text" id="movie-name" placeholder="name"/>
              <input type="number" id="movie-year" placeholder ="year"/><br>  
              <button type="button" id="js-movie-submit-btn">Submit</button>
          </form>
      </div>
`;
  }
}

function getNewMovieForm() {
  $("#js-new-movie-form-div").append(Movie.newMovieForm());
  $("#js-movie-submit-btn").on("click", function(e) {
    e.preventDefault();
    var movieValues = {
      movie: {
        name: $("#movie-name").val(),
        year: $("#movie-year").val()
      }
    };

    $.ajax({
      type: "POST",
      url: "/movies",
      dataType: "json",
      data: movieValues
    })
      .done(function() {
        $("#json-movies-table").html("");
        getMovies();
        clearMovieInputs();
      })
      .fail(function() {
        console.log("getNewMovieForm POST /movies failed");
      });
  });
}

function clearMovieInputs() {
  $("#movie-name").val("");
  $("#movie-year").val("");
}

Movie.prototype.movieHTML = function() {
  return `
            <tr>
                <td><a href="/movies/${this.id}">${this.name}<a></td>
                <td><a href="/movies/${this.id}">${this.year}<a></td>
            <tr>    
        `;
};

///////////////////////Battles

function battlesListener() {
  $("#battles-index-btn").on("click", function(e) {
    e.preventDefault();
    getBattles();
  });
  getNewBattleForm();
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
    })
    .fail(function() {
      console.log("getBattles GET /battles failed");
    });
}

function getMovieNames() {
  $.ajax({
    type: "GET",
    url: "/movies",
    dataType: "json"
  }).done(function(response) {
    let moviesList = [];
    moviesList.push(
      `<option value="" disabled selected>
        Movie Name
      </option>`
    );
    $.each(response, function(i, value) {
      moviesList.push(
        `<option id="${response.id}" value="${response[i].id}">${
          response[i].name
        }</option>`
      );
    });
    $("#movie-name").html(moviesList.join(""));
    return moviesList;
  });
}

function getCharacterNames() {
  $.ajax({
    type: "GET",
    url: "/characters",
    dataType: "json"
  }).done(function(response) {
    let charactersList = [];
    charactersList.push(
      `<option value="" disabled selected>Character Name</option>`
    );
    $.each(response, function(i, value) {
      charactersList.push(
        `<option id="${response[i].id}" value="${response[i].id}">${
          response[i].name
        }</option>`
      );
    });
    $("#character-name").html(charactersList.join(""));
    return charactersList;
  });
}

class Battle {
  constructor(obj) {
    this.name = obj.name;
    this.location = obj.location;
    this.movieName = obj.movie.name;
    this.movieYear = obj.movie.year;
    this.characterName = obj.character.name;
    this.id = obj.id;
    this.movie_id = obj.movie_id;
    this.character_id = obj.character_id;
  }
  static newBattleForm() {
    let movies = getMovieNames();
    let characters = getCharacterNames();
    return `
    <div>
          <form id="new-battle-form-js">           
              <input type="text" id="battle-name" placeholder="name"/>
              <input type="text" id="battle-location" placeholder="location"/><br>
              <select id="movie-name">
              <option value="" disabled selected>Movie Name</option>
                ${movies}
              </select>
              <select id="character-name">
              <option value="" disabled selected>Character Name</option>
                ${characters}
              </select>
              <br>
              <button type="button" id="js-battle-submit-btn">Submit</button>
          </form>
      </div>
    `;
  }
}

function getNewBattleForm() {
  $("#js-new-battle-form-div").append(Battle.newBattleForm());
  $("#js-battle-submit-btn").on("click", function(e) {
    e.preventDefault();
    var battleValues = {
      battle: {
        name: $("#battle-name").val(),
        location: $("#battle-location").val(),
        movie_id: $("#movie-name").val(),
        character_id: $("#character-name").val()
      }
    };
    // console.log("battleValues=", battleValues.battle);
    $.ajax({
      type: "POST",
      url: "/battles",
      dataType: "json",
      data: battleValues
    })
      .done(function() {
        $("#json-battles-table").html("");
        getBattles();
        clearBattleInputs();
      })
      .fail(function(xhr, textStatus, errorThrown) {
        console.log("getNewBattleForm POST /battles failed");
        // console.log("xhr.responseText=", xhr.responseText);
      });
  });
}

function clearBattleInputs() {
  $("#battle-name").val("");
  $("#battle-location").val("");
  $("#movie-name").val("");
  $("#movie-year").val("");
  $("#character-name").val("");
}

Battle.prototype.battleHTML = function() {
  return `
            <tr>
                <td><a href="/battles/${this.id}">${this.name}<a></td>
                <td><a href="/battles/${this.id}">${this.location}<a></td>
                <td><a href="/battles/${this.id}">${this.movieName}<a></td>
                <td><a href="/battles/${this.id}">${this.movieYear}<a></td>
                <td><a href="/battles/${this.id}">${this.characterName}<a></td>
            <tr>    
        `;
};

///////////////////Characters

function charactersListener() {
  $("#characters-index-btn").on("click", function(e) {
    e.preventDefault();
    getCharacters();
  });
  getNewCharacterForm();
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
    })
    .fail(function() {
      console.log("getCharacters GET /characters failed");
    });
}

class Character {
  constructor(obj) {
    this.name = obj.name;
    this.alias = obj.alias;
    this.superpowers = superpowersFx(obj.superpowers);
    this.id = obj.id;
  }
  static newCharacterForm() {
    return `
                <div>
                    <form id="new-character-form-js">           
                        <input type="text" id="character-name" placeholder="name"/>
                        <input type="text" id="character-alias" placeholder ="alias"/><br>  
                        <input type="text" id="character-superpower" placeholder ="superpower"/> 
                        <button type="button" id="js-character-submit-btn">Submit</button>
                    </form>
                </div>
            `;
  }
}

function getNewCharacterForm() {
  $("#js-character-form-div").append(Character.newCharacterForm());
  $("#js-character-submit-btn").on("click", function(e) {
    e.preventDefault();
    var characterValues = {
      character: {
        name: $("#character-name").val(),
        alias: $("#character-alias").val(),
        superpowers_attributes: [
          {
            name: $("#character-superpower").val()
          }
        ]
      }
    };

    $.ajax({
      type: "POST",
      url: "/characters",
      dataType: "json",
      data: characterValues
    })
      .done(function() {
        $("#json-characters-table").html("");
        getCharacters();
        clearInputs();
      })
      .fail(function() {
        console.log("getNewCharacterForm POST /characters failed");
      });
  });
}

function superpowersFx(objSuperpowers) {
  let superpowersAr = [];
  objSuperpowers.map(os => {
    superpowersAr.push(" " + os.name);
  });
  return superpowersAr;
}

function clearInputs() {
  $("#character-name").val("");
  $("#character-alias").val("");
  $("#character-superpower").val("");
}

Character.prototype.characterHTML = function() {
  return `
            <tr>
                <td><a href="/characters/${this.id}">${this.name}<a></td>
                <td><a href="/characters/${this.id}">${this.alias}<a></td>
                <td><a href="/characters/${this.id}">${this.superpowers}<a></td>
            <tr>    
        `;
};
