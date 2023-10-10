# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Movie.destroy_all

 url = "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1&api_key=2ff30619736c2a86478e6e5912f3e98e"
    serialized = URI.open(url).read
    data = JSON.parse(serialized)

    movies = data['results']

    movies.each do |movie|
      Movie.create(title: movie['title'], poster_path: "https://image.tmdb.org/t/p/w200#{movie['poster_path']}", overview: movie['overview'])
    end
