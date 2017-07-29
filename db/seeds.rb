require 'random_data'
include RandomData

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

#Create Posts
50.times do 
	Post.create!(
		user: users.sample,
		topic: topics.sample,
		title: RandomData.random_sentence,
		body: RandomData.random_paragraph
	)
end
posts = Post.all

50.times do 
	SponsoredPost.create!(
		topic: topics.sample,
		title: RandomData.random_sentence, 
		body: RandomData.random_paragraph, 
		price: 100
	)
end
sponsored_posts = SponsoredPost.all

#Create Comments
# #3 tells block specified # of times to run
100.times do
	Comment.create!(
# #4 call sample on the array 
		post: posts.sample,
		body: RandomData.random_paragraph
	)
end

100.times do
	Question.create!(
		title: RandomData.random_sentence,
		body: RandomData.random_paragraph, 
		resolved: false
	)
end

#create Admin user
admin = User.create!(
	name: "Anthony",
	email: "anthonyzardis@gmail.com",
	password: "helloworld",
	role: "admin"
)

#create a member
member = User.create!(
	name: "Kira",
	email: "kira@bloccit.com",
	password: 'password'
)

moderator = User.create!(
	name: 'Moderator User',
	email: "mod@example.com",
	password: "helloworld",
	#role: 'moderator'
)


#puts "#{Post.count}"
#Post.find_or_create_by(title: "Super unique title", body: "Super unique body")
#puts "#{Post.count}"

#puts "#{Comment.count}"
#Comment.find_or_create_by(post: posts.sample, body: "Also super unique body")
#puts "#{Comment.count}"

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{SponsoredPost.count} sponsored posts created"
puts "#{Comment.count} comments created"
puts "#{Question.count} questions created"
