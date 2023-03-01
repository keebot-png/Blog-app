# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'Keenan', photo: 'https://cdn.pixabay.com/photo/2023/01/05/22/35/flower-7700011_640.jpg', bio: 'Teacher in South Africa', posts_counter: 17)
second_user = User.create(name: 'Noqs', photo: 'https://cdn.pixabay.com/photo/2023/01/22/13/46/swans-7736415__340.jpg', bio: 'Teacher in South Africa', posts_counter: 22)

first_post = Post.create(author: second_user, title: 'First Post', text: 'This is my first post', comments_counter: 84, likes_counter: 9)
second_post = Post.create(author: first_user, title: 'Second Post', text: 'This is the second post', comments_counter: 101, likes_counter: 13)

Comment.create(post: first_post, author: first_user, text: 'Hi there!' )
Like.create(post: first_post, author: first_user)

Comment.create(post: second_post, author: second_user, text: 'Hi there sir!' )
Like.create(post: second_post, author: second_user)