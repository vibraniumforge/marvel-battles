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
    {name: "Ant-Man and the Wasp", year: 2018},
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
    {name:"Janet Van Dyne", callsign:"The Wasp"},
    {name:"Obadiah Stane", callsign:"Iron Monger"},
    {name:"Emil Blonsky", callsign:"Abomination"},
    {name:"Ivan Vanko", callsign:"Whiplash"},
    {name:"Loki Laufeyson", callsign:"Loki"},
    {name:"Johann Schmidt", callsign:"Red Skull"},
])


superpowers = Superpower.create([
    {name: "Super Soldier Serum"},
    {name: "Power Suit"},
    {name: "Rage Monster"},
    {name: "God of Thunder"},
    {name: "Assasin"},
    {name: "Arrows"},
    {name: "Shrinking Suit"},
    {name: "Magic"},
    {name: "Runs Fast"},
    {name: "Vibranium Suit"},
    {name: "Spider Powers"},
])