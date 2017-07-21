# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'random_data'
include RandomData

15.times do
	Topic.create!(
		name: RandomData.random_sentence,
		description: RandomData.random_paragraph
	)
end
topics = Topic.all

#Create Posts
50.times do 

	# #1 ! instructs method to raise an error if there is a problem with data being seeded
	Post.create!(
		topic: topics.sample,
	# #2 RandomData wishful coding 
		title: RandomData.random_sentence,
		body: RandomData.random_paragraph
	)
end

posts = Post.all

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

puts "#{Post.count}"
Post.find_or_create_by(title: "Super unique title", body: "Super unique body")
puts "#{Post.count}"

puts "#{Comment.count}"
Comment.find_or_create_by(post: posts.sample, body: "Also super unique body")
puts "#{Comment.count}"

puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Question.count} questions created"
