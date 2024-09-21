require "rails_helper"

RSpec.describe Comment, type: :model do
  let(:user) { User.create(email: "test@example.com", password: "password", name: "Test User") }
  let(:post) { Post.create(content: "This is a test post", user: user) }
  let(:comment) { Comment.new(content: "This is a test comment", user: user, post: post) }

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
    it { should belong_to(:parent).class_name("Comment").optional }
    it { should have_many(:replies).class_name("Comment").with_foreign_key("parent_id").dependent(:destroy) }
  end

  describe "validations" do
    it "is valid with valid attributes" do
      expect(comment).to be_valid
    end

    it "is not valid without content" do
      comment.content = nil
      expect(comment).to_not be_valid
    end

    it "is not valid without a user" do
      comment.user = nil
      expect(comment).to_not be_valid
    end

    it "is not valid without a post" do
      comment.post = nil
      expect(comment).to_not be_valid
    end
  end
end
