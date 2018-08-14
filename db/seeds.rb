# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

# User.create(name: "tsy", email: 'mimimhmh@qq.com',password: "1234")

User.create!(name:  "tsy",
             email: "taosiyu@126.com",
             password:              "1234567",
             password_confirmation: "1234567")

User.create!(name:  "tsy2",
             email: "taosiyu2@126.com",
             password:              "12345678",
             password_confirmation: "12345678")

100.times do |i|
  Card.create!(
      title: Faker::Name.name,
      detail: Faker::Book.title,
      content: Faker::Book.title,
      clicks: i,
      images: "image",
      cardtype: "type",
      user_id: User.first.id
  )
end

Card.all.each do |contact|
  Random.rand(5).times do
    commit = Comment.create!(user_id: User.first.id, content: "哈哈哈哈看到了",card_id: contact.id)
    contact.comments << commit
    contact.save!
  end
end

50.times do |num|
  Discovery.create!(
      title: Faker::Name.name,
      dtype: num,
      content: Faker::Book.title,
      image: "image",
  )
end

Discovery.all.each do |dis|
  Random.rand(5).times do
    commit = Dcomment.create!(user_id: User.first.id, content: "这个是兴趣的评论", discovery_id: dis.id)
    dis.dcomments << commit
    dis.save!
  end
end
