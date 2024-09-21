require "rails_helper"

RSpec.describe Post, type: :model do
  let(:user) { User.create(email: "test@example.com", password: "password", name: "Test User") }
  let(:post) { Post.new(content: "This is a test post", user: user) }

  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:comments).dependent(:destroy) }
  end

  describe "validations" do
    it "is valid with valid attributes" do
      expect(post).to be_valid
    end

    it "is not valid without content" do
      post.content = nil
      expect(post).to_not be_valid
    end

    it "is not valid without a user" do
      post.user = nil
      expect(post).to_not be_valid
    end
  end
end
