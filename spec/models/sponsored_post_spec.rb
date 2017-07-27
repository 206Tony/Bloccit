require 'rails_helper'
include RandomData
RSpec.describe SponsoredPost, type: :model do
  #let(:name) { RandomData.random_sentence }
  #let(:description) { RandomData.random_paragraph }	
  #let(:title) { RandomData.random_sentence }
  #let(:body) { RandomData.random_paragraph } 
  #let(:price) {100}

  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:sponsored_post) {topic.sponsored_posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 100)}

  it {is_expected.to belong_to(:topic) }

  describe "attributes" do
  	it "should respond to title" do
  		expect(sponsored_post).to respond_to(:title)
    end

    it "should respond to body" do
      expect(sponsored_post).to respond_to(:body)
  	end

    it "should respond to price" do
      expect(sponsored_post).to respond_to(:price)
    end
  end
end

