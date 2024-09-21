require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) { User.new(email: "test@example.com", password: "password", name: "Test User") }

  describe "validations" do
    it "is valid with valid attributes" do
      expect(user).to be_valid
    end

    it "is not valid without an email" do
      user.email = nil
      expect(user).to_not be_valid
    end

    it "is not valid without a password" do
      user.password = nil
      expect(user).to_not be_valid
    end

    it "is not valid with a duplicate email" do
      User.create(email: "test@example.com", password: "password", name: "Another User")
      expect(user).to_not be_valid
    end
  end

  describe "associations" do
    it { should have_many(:posts).dependent(:destroy) }
    it { should have_many(:active_connections).class_name("Connection").with_foreign_key(:follower_id).dependent(:destroy) }
    it { should have_many(:followings).through(:active_connections).source(:followed) }
    it { should have_many(:passive_connections).class_name("Connection").with_foreign_key(:followed_id).dependent(:destroy) }
    it { should have_many(:followers).through(:passive_connections).source(:follower) }
  end

  describe "#following?" do
    let(:another_user) { User.create(email: "another@example.com", password: "password", name: "Another User") }

    it "returns true if the user is following another user" do
      user.followings << another_user
      expect(user.following?(another_user)).to be_truthy
    end

    it "returns false if the user is not following another user" do
      expect(user.following?(another_user)).to be_falsey
    end
  end
end
