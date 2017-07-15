require 'rails_helper'

# #6 Rspec created test for PC. type: :controller tells RSpec to treat test as a controller test.
# Allowing simulate controller actions such as HTTP requests
RSpec.describe PostsController, type: :controller do
  # #8 create a post and assign it to my_post using let 
  #RandomData gives it random title and body
  let(:my_post) { Post.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }

  describe "GET #index" do
    it "returns http success" do
# #7 Test performs a GET on the index view and expects the response to be a success

      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_post] to @posts" do
      get :index
# #9 b/c our test created one post (my_post) we expect index to return an array of 1 item
# assigns a method o fActionController::TestCase
#assigns gives test action to "instance vars assigned in the action that are avali. for the view"
      expect(assigns(:posts)).to eq([my_post])
    end
  end

# #10 comment out tests for show, new, and edit until implementation is written
#  describe "GET show" do
#    it "returns http success" do
#      get :show
#      expect(response).to have_http_status(:success)
#    end
#  end

#  describe "GET new" do
#    it "returns http success" do
#      get :new
#      expect(response).to have_http_status(:success)
#    end
#  end

#  desrcibe "GET edit" do
#    it "returns http success" do
#      get :edit 
#      expect(response).to have_http_status(:success)
#    end
#  end
end
