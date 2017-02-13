Movie.create!([
  {
    title: 'Iron Man',
    description: 
    %{
      When wealthy industrialist Tony Stark is forced to build an 
      armored suit after a life-threatening incident, he ultimately 
      decides to use its technology to fight against evil.
    }.squish,
    image_file_name: 'ironman.jpg',
    cast: 'Robert Downey Jr., Gwyneth Paltrow and Terrence Howard',
    released_on: "2008-05-02",
    duration: '126 min',
    director: 'Jon Favreau',
    rating: 'PG-13',
    total_gross: 318_412_101
  },
  {
    title: 'Superman',
    description: 
    %{
      An alien orphan is sent from his dying planet to Earth, where 
      he grows up to become his adoptive home's first and greatest 
      super-hero.
    }.squish,
    image_file_name: 'superman.jpg',
    cast: 'Christopher Reeve, Margot Kidder and Gene Hackman',
    released_on: "1978-12-15",
    duration: '143 min',
    director: 'Richard Donner',
    rating: 'PG',
    total_gross: 134_218_018
  },
  {
    title: 'Spider-Man',
    description: 
    %{
      When bitten by a genetically modified spider, a nerdy, shy, and 
      awkward high school student gains spider-like abilities that he 
      eventually must use to fight evil as a superhero after tragedy 
      befalls his family.
    }.squish,
    image_file_name: 'spiderman.jpg',
    cast: 'Tobey Maguire, Kirsten Dunst and Willem Dafoe',
    released_on: "2002-05-03",
    duration: '121 min',
    director: 'Sam Raimi',
    rating: 'PG-13',
    total_gross: 403_706_375
  },
  {
    title: 'Batman',
    description: 
    %{
      The Dark Knight of Gotham City begins his war on crime with his 
      first major enemy being the clownishly homicidal Joker.
    }.squish,
    image_file_name: 'batman.jpg',
    cast: 'Michael Keaton, Jack Nicholson and Kim Basinger',
    released_on: "1989-06-23",
    duration: '126 min',
    director: 'Tim Burton',
    rating: 'PG-13',
    total_gross: 251_188_924
  },
  {
    title: "Catwoman",
    description: 
    %{
      Patience Philips seems destined to spend her life apologizing for taking up space. 
      Despite her artistic ability-she has a more than respectable career as a graphic 
      designer.
    }.squish,
    image_file_name: "catwoman.jpg",
    cast: "Halle Berry, Sharon Stone and Benjamin Bratt",
    released_on: "2004-07-23",
    duration: "101 min",
    director: "Jean-Christophe 'Pitof' Comar",
    rating: "PG-13",
    total_gross: 40_200_000
  },
  {
    title: 'Batman vs. Godzilla',
    description: 
    %{
      An epic battle between The Caped Crusader and the fire-breathing dinosaur Gojira.
      Hang on to your popcorn, kids!
    }.squish,
    image_file_name: 'batman-vs-godzilla.jpg',
    cast: 'Bruce Wayne, Gojira',
    released_on: 10.days.from_now,
    duration: '211 min',
    director: 'Ishiro Honda',
    rating: 'PG-13',
    total_gross: 387_623_910
  }
])

user1 = User.create!(name: "Gerald", username: "gerald101", email: "ryumaster001@yahoo.com", password: "12345678", password_confirmation: "12345678", admin: true)
user2 = User.create!(name: "Heidy", username: "heidy101", email: "heidy@yahoo.com", password: "12345678", password_confirmation: "12345678")

genre1 = Genre.create!(name: "Action")
genre2 = Genre.create!(name: "Comedy")
genre3 = Genre.create!(name: "Drama")
genre4 = Genre.create!(name: "Romance")
genre5 = Genre.create!(name: "Thriller")
genre6 = Genre.create!(name: "Fantasy")
genre7 = Genre.create!(name: "Documentary")
genre8 = Genre.create!(name: "Adventure")
genre9 = Genre.create!(name: "Animation")
genre10 = Genre.create!(name: "Sci-Fi")

movie = Movie.find_by(title: "Iron Man")
movie.reviews.create!(stars: 3, comment: "I laughed, I cried, I spilled my popcorn!", location: "Springfield, VA", user: user1)
movie.reviews.create!(stars: 5, comment: "I'm a better reviewer than he is.", location: "Springfield, NC", user: user1)
movie.reviews.create!(stars: 4, comment: "It's been years since a movie superhero was this fierce and this funny.", location: "Springfield, SC", user: user1)
movie.favorites.create!(user: user1)
movie.favorites.create!(user: user2)
movie.genres << genre1
movie.genres << genre8
movie.genres << genre10

movie = Movie.find_by(title: 'Superman')
movie.reviews.create!(stars: 5, comment: "It's a bird, it's a plane, it's a blockbuster!", location: "Springfield, NY", user: user2)
movie.favorites.create!(user: user2)
movie.genres << genre1
movie.genres << genre6
movie.genres << genre10

