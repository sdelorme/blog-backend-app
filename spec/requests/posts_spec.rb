require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    it "works! (now write some real specs)" do

      user = User.create!(name: "Seth", email: "seth@email.com", password: "password")

      
      post = Post.create!(title: "New Sample post", body: "What's love got to do got to do with it", image: "i got nothing for you", user_id: 12)

      get "/api/posts"
      posts = Post.all
      expect(response).to have_http_status(200)
      expect(posts.length).to eq(1)
    end
  end
end
