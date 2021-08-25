require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET /new " do
    it "responds with 200" do
      user = User.create(username: 'username', email: 'test@test.com', password: "password", password_confirmation: "password") ## uncomment if not using FactoryBot
      sign_in user
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "responds with 200 given a message" do
      user = User.create(username: 'username', email: 'test@test.com', password: "password", password_confirmation: "password") ## uncomment if not using FactoryBot
      sign_in user
      post :create, params: { post: { message: "Hello, world!" } }
      expect(response).to redirect_to(posts_url)
    end

    it "creates a post" do
      user = User.create(username: 'username', email: 'test@test.com', password: "password", password_confirmation: "password") ## uncomment if not using FactoryBot
      sign_in user
      post :create, params: { post: { message: "Hello, world!" } }
      expect(Post.find_by(message: "Hello, world!")).to be
    end
  end

  describe 'POST #create' do
    it 'attaches the uploaded file' do
      user = User.create(username: 'username', email: 'test@test.com', password: "password", password_confirmation: "password") ## uncomment if not using FactoryBot
      sign_in user
      file = fixture_file_upload("#{Rails.root}/spec/files/attachment.jpeg" , 'image/png')
      expect {
      post :create, params: { post: { images: [file] } }
      }.to change(ActiveStorage::Attachment, :count).by(1)
    end
  end

  describe "GET /" do
    it "responds with 200" do
      user = User.create(username: 'username', email: 'test@test.com', password: "password", password_confirmation: "password") ## uncomment if not using FactoryBot
      sign_in user
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
