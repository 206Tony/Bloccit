require 'rails_helper'

RSpec.describe Post, type: :model do
  
  # #1 let creates new instance of Post class, and name it post
  #let(:post) { Post.create!(title: "New Post Title", body: "New Post Body" )}
  let(:name) { RandomData.random_sentence }
  let(:description) { RandomData.random_paragraph }
  let(:title) { RandomData.random_sentence } 
  let(:body) { RandomData.random_paragraph }

  # #3 create parent topic for post
  let(:topic) { Topic.create!(name: name, description: description) }
  # #4 assoc. post w/ topic via topic.posts.create!
  let(:post) { topic.posts.create!(title: title, body: body) }

  it { is_expected.to belong_to(:topic) }

  # #2 test if post has attr of title and body
  # determines if post returns nil or post.title or post.body
  describe "attributes" do
  	it "has title and body attributes" do
  		expect(post).to have_attributes(title: title, body: body)
  	end
  end
end
