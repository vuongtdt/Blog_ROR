# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Post.create(user_id: 1, title: "Title-1", body: "123")
Post.create(user_id: 2, title: "Title-2", body: "123")
Post.create(user_id: 2, title: "Title-3", body: "123")
Post.create(user_id: 1, title: "Title-4", body: "123")