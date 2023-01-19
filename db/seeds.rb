# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
user2 = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
user3 = User.create(name: 'Shelby', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Australia.')

post1 = Post.create(author: user2, title: 'Hello', text: 'This is my first post')
post2 = Post.create(author: user2, title: 'Hello', text: 'This is my second post')
post3 = Post.create(author: user2, title: 'Hello', text: 'This is my third post')
post4 = Post.create(author: user2, title: 'Hello', text: 'This is my fourth post')

comment1 = Comment.create(post: post1, author: user2, text: 'Hi Tom!' )
comment2 = Comment.create(post: post1, author: user2, text: 'how are you!' )
comment3 = Comment.create(post: post1, author: user2, text: 'I like your post!' )
comment4 = Comment.create(post: post1, author: user3, text: 'It is such a nice post!' )
comment5 = Comment.create(post: post1, author: user3, text: 'I am really inspired!' )
comment6 = Comment.create(post: post1, author: user3, text: 'Bye!' )

