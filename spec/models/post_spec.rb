require 'rails_helper'

RSpec.describe Post, type: :model do
  
  # #1 let creates new instance of Post class, and name it post
  let(:post) { Post.create!(title: "New Post Title", body: "New Post Body" )}

  # #2 test if post has attr of title and body
  # determines if post returns nil or post.title or post.body
  describe "attributes" do
  	it "has title and body attributes" do
  		expect(post).to have_attributes(title: "New Post Title", body: "New Post Body")
  	end
  end
end
