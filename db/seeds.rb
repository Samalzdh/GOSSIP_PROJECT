require 'faker' 
Faker::Config.locale = 'fr' 


10.times do |index|
  City.create!(
  zip_code: Faker::Address.zip_code,
  name: Faker::Address.city )
end

10.times do |index|
  User.create!(
   first_name: Faker::Name.first_name,
   last_name: Faker::Name.last_name,
   description: Faker::Lorem.sentence(word_count: 10),
   email: Faker::Internet.email,
   age: Faker::Number.between(from: 18, to: 80),
   city: City.all.sample
    )
end



6.times do 
  user = User.all.sample
  Gossip.create!(
    title: Faker::Book.title,
    content: Faker::Quote.matz,
    user: user
  )
end

10.times do
  Tag.create!(
    title: Faker::Book.genre 
  )
end

Gossip.all.each do |gossip|
  rand(1..5).times do 
    InterTagGossip.create!(
      gossip: gossip,
      tag: Tag.all.sample
    )
  end
end
