require 'random_data'

5.times do
	User.create!(
		name: RandomData.random_name, 
		email: RandomData.random_email, 
		password: RandomData.random_sentence
	)
end
users = User.all 

15.times do
	Topic.create!(
		name: RandomData.random_sentence,
		description: RandomData.random_paragraph
	)
end
topics = Topic.all

50.times do 
	post = Post.create!(
		user: users.sample,
		topic: topics.sample,
		title: RandomData.random_sentence,
		body: RandomData.random_paragraph
	)

	post.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
	rand(1..5).times {post.votes.create!(value: [-1, 1].sample, user: users.sample) }
end
posts = Post.all

100.times do
	Comment.create!(
		user: users.sample,
		post: posts.sample,
		body: RandomData.random_paragraph
	)
end

admin = User.create!(
	name: "Anthony",
	email: "anthonyzardis@gmail.com",
	password: "helloworld",
	role: "admin"
)

member = User.create!(
	name: "Kira",
	email: "kira@bloccit.com",
	password: 'password'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Vote.count} votes created"
