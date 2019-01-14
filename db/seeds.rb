# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

movies = Movie.create([
    {name: "Iron Man", year: 2008},
    {name: "The Incredible Hulk", year: 2008},
    {name: "Iron Man 2", year: 2010},
    {name: "Thor", year: 2011},
    {name: "Captain America: The First Avenger", year: 2011},
    {name: "The Avengers", year: 2012},
    {name: "Iron Man 3", year: 2013},
    {name: "Thor: The Dark World", year: 2013},
    {name: "Captain America: The Winter Soldier", year: 2014},
    {name: "Guardians of the galaxy", year: 2014},
    {name: "Avengers: Age of Ultron", year: 2015},
    {name: "Ant-Man", year: 2015},
    {name: "Captain America: Civil War", year: 2016},
    {name: "Doctor Strange", year: 2016},
    {name: "Guardians of the Galaxy Vol. 2", year: 2017},
    {name: "Spider-Man: Homecoming", year: 2017},
    {name: "Thor:Ragnarok", year: 2017},
    {name: "Black Panther", year: 2018},
    {name: "Avengers: Infinity War", year: 2018},
    {name: "Ant-Man and the Wasp", year: 2018}
])

characters = Character.create([
    {name:"Steve Rogers", callsign:"Captain America"},
    {name:"Tony Stark", callsign:"Iron Man"},
    {name:"Bruce Banner", callsign:"The Hulk"},
    {name:"Thor Odinson", callsign:"Thor"},
    {name:"Natasha Romanoff", callsign:"Black Widow"},
    {name:"Clint Barton", callsign:"Hawkeye"},
    {name:"James Rhoades", callsign:"War Machine"},
    {name:"James Barnes", callsign:"Winter Soldier"},
    {name:"Sam Wilson", callsign:"Falcon"},
    {name:"Pietro Maximoff", callsign:"Quicksilver"},

    {name:"Wanda Maximoff", callsign:"Scarlet Witch"},
    {name:"Scott Lang", callsign:"Ant-Man"},
    {name:"Peter Parker", callsign:"Spider-Man"},
    {name:"Steven Strange", callsign:"Dr. Strange"},
    {name:"T'Challa", callsign:"Black Panther"},
    {name:"Hope Van Dyne", callsign:"The Wasp"},
])

superpowers = Superpower.create([
    {name: "Super Soldier Serum", character_id: Character.find_by(name: "Steve Rogers").id },
    {name: "Power Suit", character_id: Character.find_by(name: "Tony Stark").id },
    {name: "Rage Monster", character_id: Character.find_by(name: "Bruce Banner").id },
    {name: "God of Thunder", character_id: Character.find_by(name: "Thor Odinson").id },
    {name: "Assasin", character_id: Character.find_by(name: "Natasha Romanoff").id },
    {name: "Arrows", character_id: Character.find_by(name: "Clint Barton").id },
    {name: "Power Suit", character_id: Character.find_by(name: "James Rhoades").id },
    {name: "Jetpack", character_id: Character.find_by(name: "Sam Wilson").id },
    {name: "Vibranium Arm", character_id: Character.find_by(name: "James Barnes").id },
    {name: "Magic", character_id: Character.find_by(name: "Wanda Maximoff").id },

    {name: "Runs Fast", character_id: Character.find_by(name: "Pietro Maximoff").id },
    {name: "Shrinking Suit", character_id: Character.find_by(name: "Scott Lang").id },
    {name: "Magic", character_id: Character.find_by(name: "Steven Strange").id },
    {name: "Spider Powers", character_id: Character.find_by(name: "Peter Parker").id },
    {name: "Vibranium Suit", character_id: Character.find_by(name: "T'Challa").id },
    {name: "Shrinking Suit with Wings", character_id: Character.find_by(name: "Hope Van Dyne").id },
])