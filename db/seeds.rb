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

post1 = Post.create(author_id: user2.id, title: 'Hello', text: 'This is my first post')
post2 = Post.create(author_id: user2.id, title: 'Hello', text: 'This is my second post')
post3 = Post.create(author_id: user2.id, title: 'Hello', text: 'This is my third post')
post4 = Post.create(author_id: user2.id, title: 'Hello', text: 'This is my fourth post')

comment1 = Comment.create(post_id: post1.id, author_id: user2.id, text: 'Hi Tom!' )
comment2 = Comment.create(post_id: post1.id, author_id: user2.id, text: 'how are you!' )
comment3 = Comment.create(post_id: post1.id, author_id: user2.id, text: 'whats up' )
comment4 = Comment.create(post_id: post1.id, author_id: user2.id, text: 'what do you do' )
comment5 = Comment.create(post_id: post1.id, author_id: user2.id, text: 'how is your house' )
comment6 = Comment.create(post_id: post1.id, author_id: user2.id, text: 'what is your name' )

