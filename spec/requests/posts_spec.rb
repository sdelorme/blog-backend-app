require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    it "works! (now write some real specs)" do

      user = User.create!(name: "Seth", email: "seth@email.com", password: "password")

      
      post = Post.create!(title: "New Sample post", body: "What's love got to do got to do with it", image: "i got nothing for you", user_id: user.id)

      get "/api/posts"
      posts = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(posts.length).to eq(1)
    end
  end

  describe "POST /posts" do
    it "should create a new post in the db" do

      user = User.create!(name: "Seth", email: "seth@email.com", password: "password")

      jwt = JWT.encode(
        {
          user: user.id, # the data to encode
          exp: 24.hours.from_now.to_i # the expiration time
        },
        "random", # the secret key
        'HS256' # the encryption algorithm
      )

      post "/api/posts", params: {
        title: "test title",
        body: "test body",
        image: "test image"
      },
      
      headers: {"Authorization" => "Bearer #{jwt}"}
      post = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(post["title"]).to eq("test title")
      expect(post["body"]).to eq("test body")
      expect(post["image"]).to eq("test image")
    end
  end
end
