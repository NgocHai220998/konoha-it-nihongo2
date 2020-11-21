# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create({
  nickname: 'thanhan1181999',
  mail: 'nguyenthanhan1181999@gmail.com',
  name: 'Nguyen Thanh An',
  sex:  1,
  age: 18,
  image: 'https://cdn.24h.com.vn/upload/4-2020/images/2020-11-20/1605869023-641-thumbnail-width660height440.jpg',
  password: 'abc2468xyz'
})
user1.posts.create({
  content: 'this is the first post',
  typing: 1,
  image: 'https://cdn.24h.com.vn/upload/4-2020/images/2020-11-20/1605869023-641-thumbnail-width660height440.jpg'
})
Post.find(1).comments.create!({
  content: 'this is the first comment',
  user_id: 1
})
Post.find(1).notifications.create({
  state: 1,
  typing: 1
})
Like.create({user_id: 1, post_id: 1})

