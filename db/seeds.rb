puts "seeding DB..."

Movie.destroy_all
Superpower.destroy_all
Character.destroy_all

Movie.create([
    { name: "Iron Man", year: 2008, poster: "Iron_Man_poster.jpg" },
    { name: "The Incredible Hulk", year: 2008, poster: "The_Incredible_Hulk_poster.jpg" },
    { name: "Iron Man 2", year: 2010, poster: "Iron_Man_2_poster.jpg" },
    { name: "Thor", year: 2011, poster: "Thor_poster.jpg"},
    { name: "Captain America: The First Avenger", year: 2011, poster: "Captain_America_The_First_Avenger_poster.jpg"},
    { name: "The Avengers", year: 2012, poster: "Avengers_poster.jpg"},
    { name: "Iron Man 3", year: 2013, poster: "Iron_Man_3_poster.jpg"},
    { name: "Thor: The Dark World", year: 2013, poster: "Thor_-_The_Dark_World_poster.jpg"},
    { name: "Captain America: The Winter Soldier", year: 2014, poster: "Captain_America_The_Winter_Soldier.jpg"},
    { name: "Guardians of the Galaxy", year: 2014, poster: "Guardians_of_the_Galaxy_poster.jpg"},
    { name: "Avengers: Age of Ultron", year: 2015, poster: "Avengers_Age_of_Ultron_poster.jpg"},
    { name: "Ant-Man", year: 2015, poster: "Ant-Man_poster.jpg"},
    { name: "Captain America: Civil War", year: 2016, poster: "Captain_America_Civil_War_poster.jpg"},
    { name: "Doctor Strange", year: 2016, poster: "Doctor_Strange_poster.jpg"},
    { name: "Guardians of the Galaxy Vol. 2", year: 2017, poster: "Guardians_of_the_Galaxy_Vol_2_poster.jpg"},
    { name: "Spider-Man: Homecoming", year: 2017, poster: "Spider-Man_Homecoming_poster.jpg"},
    { name: "Thor: Ragnarok", year: 2017, poster: "Thor_Ragnarok_poster.jpg"},
    { name: "Black Panther", year: 2018, poster: "Black_Panther_poster.jpg"},
    { name: "Avengers: Infinity War", year: 2018, poster: "Avengers_Infinity_War_poster.jpg"},
    { name: "Ant-Man and the Wasp", year: 2018, poster: "Ant-Man_and_the_Wasp_poster.jpg"}
])

Character.create([
    { name: "Steve Rogers", alias: "Captain America"},
    { name: "Tony Stark", alias: "Iron Man"},
    { name: "Bruce Banner", alias: "The Hulk"},
    { name: "Thor Odinson", alias: "Thor"},
    { name: "Natasha Romanoff", alias: "Black Widow"},
    { name: "Clint Barton", alias: "Hawkeye"},
    { name: "James Rhoades", alias: "War Machine"},
    { name: "James Barnes", alias: "Winter Soldier"},
    { name: "Sam Wilson", alias: "Falcon"},
    { name: "Pietro Maximoff", alias: "Quicksilver"},
    { name: "Wanda Maximoff", alias: "Scarlet Witch"},
    { name: "Vision", alias: "Vision"},
    { name: "Scott Lang", alias: "Ant-Man"},
    { name: "Peter Parker", alias: "Spider-Man"},
    { name: "Steven Strange", alias: "Dr. Strange"},
    { name: "T'Challa", alias: "Black Panther"},
    { name: "Hope Van Dyne", alias: "The Wasp"},
])

Superpower.create([
    { name: "Super Soldier Serum", character_id: Character.find_by(name: "Steve Rogers").id },
    { name: "Vibranium Shield", character_id: Character.find_by(name: "Steve Rogers").id },
    { name: "Power Suit", character_id: Character.find_by(name: "Tony Stark").id },
    { name: "Arc Reactor", character_id: Character.find_by(name: "Tony Stark").id },
    { name: "Flight", character_id: Character.find_by(name: "Tony Stark").id },
    { name: "Rage Monster", character_id: Character.find_by(name: "Bruce Banner").id },
    { name: "Super Soldier Serum", character_id: Character.find_by(name: "Bruce Banner").id },
    { name: "God of Thunder", character_id: Character.find_by(name: "Thor Odinson").id },
    { name: "Alien", character_id: Character.find_by(name: "Thor Odinson").id },
    { name: "Mjolnir the Hammer", character_id: Character.find_by(name: "Thor Odinson").id },
    { name: "Assasin", character_id: Character.find_by(name: "Natasha Romanoff").id },
    { name: "Arrows", character_id: Character.find_by(name: "Clint Barton").id },
    { name: "War Machine mark 3 Suit", character_id: Character.find_by(name: "James Rhoades").id },
    { name: "Arc Reactor", character_id: Character.find_by(name: "James Rhoades").id },
    { name: "Flight", character_id: Character.find_by(name: "James Rhoades").id },
    { name: "Jetpack", character_id: Character.find_by(name: "Sam Wilson").id },
    { name: "Flight", character_id: Character.find_by(name: "Sam Wilson").id },
    { name: "Super Soldier Serum", character_id: Character.find_by(name: "James Barnes").id },
    { name: "Vibranium Arm", character_id: Character.find_by(name: "James Barnes").id },
    { name: "Magic", character_id: Character.find_by(name: "Wanda Maximoff").id },
    { name: "Runs Fast", character_id: Character.find_by(name: "Pietro Maximoff").id },
    { name: "Robot", character_id: Character.find_by(name: "Vision").id },
    { name: "The Mind Infinity Stone", character_id: Character.find_by(name: "Vision").id },
    { name: "Shrinking Suit", character_id: Character.find_by(name: "Scott Lang").id },
    { name: "Magic", character_id: Character.find_by(name: "Steven Strange").id },
    { name: "The Time Infinity Stone", character_id: Character.find_by(name: "Steven Strange").id },
    { name: "Spider Powers", character_id: Character.find_by(name: "Peter Parker").id },
    { name: "Vibranium Suit", character_id: Character.find_by(name: "T'Challa").id },
    { name: "Heart Shaped Herb", character_id: Character.find_by(name: "T'Challa").id },
    { name: "Shrinking Suit with Wings", character_id: Character.find_by(name: "Hope Van Dyne").id },
    { name: "Flight", character_id: Character.find_by(name: "Hope Van Dyne").id }
])

puts "seeds done!"
