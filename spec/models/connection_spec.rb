require "rails_helper"

RSpec.describe Connection, type: :model do
  let(:follower) { User.create(email: "follower@example.com", password: "password", name: "Follower User") }
  let(:followed) { User.create(email: "followed@example.com", password: "password", name: "Followed User") }
  let(:connection) { Connection.new(follower: follower, followed: followed) }

  describe "associations" do
    it { should belong_to(:follower).class_name("User") }
    it { should belong_to(:followed).class_name("User") }
  end

  describe "validations" do
    it "is valid with valid attributes" do
      expect(connection).to be_valid
    end

    it "is not valid without a follower" do
      connection.follower = nil
      expect(connection).to_not be_valid
    end

    it "is not valid without a followed user" do
      connection.followed = nil
      expect(connection).to_not be_valid
    end
  end
end
