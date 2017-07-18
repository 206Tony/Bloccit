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
  describe "GET show" do
    it "returns http success" do
# #16 pass {id: my_post.id} to show as a parameter which are passed to params hash
      get :show, params: { id: my_post.id }
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #show view" do
# #17 expect the response to return the show view using the render_template matcher
      get :show, params: { id: my_post.id }
      expect(response).to render_template :show
    end

    it "assigns my_post to @post" do
      get :show, params: { id: my_post.id }
# #18 expect post to = my_post b/c call show with the id my_post
#testing that post returned is post asked for 
      expect(assigns(:post)).to eq(my_post)
      end
  end

# #1
  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

# #2
    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

# #3
    it "instantiates @post" do
      get :new
      expect(assigns(:post)).not_to be_nil
    end
  end

  describe "POST create" do
# #4
    it "increases the number of Post by 1" do
      expect{ post :create, params: { post: { title: RandomData.random_sentence, body: RandomData.random_paragraph } } }.to change(Post,:count).by(1)
    end

  # #5
    it "assigns the new post to @post" do
      post :create, params: { post: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }
      expect(assigns(:post)).to eq Post.last
    end

  # #6
    it "redirects to the new post" do
      post :create, params: {post: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }
      expect(response).to redirect_to Post.last
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, params: { id: my_post.id } 
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, params: { id: my_post.id }
# #1 expect edit view to render when a post is edited
      expect(response).to render_template :edit
    end

# #2 test that edit assigns the correct post to be updated to @post
    it "assigns post to be updated to @post" do
      get :edit, params: { id: my_post.id }
      post_instance = assigns(:post)

      expect(post_instance.id).to eq my_post.id 
      expect(post_instance.title).to eq my_post.title
      expect(post_instance.body).to eq my_post.body
    end
  end

  describe "PUT update" do
    it "updates post with expected attributes" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph

      put :update, params: { id: my_post.id, post: {title: new_title, body: new_body } }
# #3 test that @post was updated w/ title and body passed to update
# and that @post's id wasn't changed
      updated_post = assigns(:post)
      expect(updated_post.id).to eq my_post.id
      expect(updated_post.title).to eq new_title
      expect(updated_post.body).to eq new_body
    end

    it "redirects to the updated post" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
# #4 expect to be redirected to the posts show view after the update
      put :update, params: { id: my_post.id, post: {title: new_title, body: new_body } }
      expect(response).to redirect_to my_post
    end
  end 

  describe "DELETE destroy" do
    it "deletes the post" do
      delete :destroy, params: { id: my_post.id }
# #6 search db for post w/ id = to my_post.id.returns an Array.
# assign size of array to count and expect count to = 0
# this makes sure db won't have a matching post after destroy is called 
      count = Post.where({id: my_post.id}).size 
      expect(count).to eq 0
    end

    it "redirects to posts index" do
      delete :destroy, params: { id: my_post.id }
# #7 expect to be redirected to the posts index view after a post has been deleted.
      expect(responce).to redirect_to posts_path
    end
  end
end
