puts 'creating random user account ....'

# Users
10.times do
  pwd = Faker::Internet.password
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email(name: "#{first_name} #{last_name}", separators: '.')
  hash = { first_name: first_name, last_name: last_name, email: email }
  hash.merge!({ password: pwd })
  user = User.new(hash)
  user.confirmed_at = Time.now.since(rand(-10000000..10000000).seconds)
  user.password_confirmation = pwd
  user.save
end

# Posts
puts 'creating random posts for each user ....'
User.all.each do |user|
  rand(3..30).times do
    title = Faker::Lorem.sentence
    content =  Faker::Lorem.sentence(word_count: 30)
    hash = { title: title, content: content }
    user.posts.new(hash).save
  end
end

# Comments
puts 'creating random comments for each post ....'
users = User.all
Post.all.each do |post|
  rand(3..30).times do
    content =  Faker::Lorem.sentence(word_count: 30)
    hash = { content: content }
    koment = post.comments.new(hash)
    koment.user = users.sample
    koment.save
  end
end
