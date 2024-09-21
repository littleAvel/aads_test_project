# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Users who we follow (followings)
  has_many :active_connections, foreign_key: :follower_id, class_name: "Connection", dependent: :destroy
  has_many :followings, through: :active_connections, source: :followed

  # Users who follow the user (followers)
  has_many :passive_connections, foreign_key: :followed_id, class_name: "Connection", dependent: :destroy
  has_many :followers, through: :passive_connections, source: :follower

  has_many :posts, dependent: :destroy

  def following?(user)
    followings.include?(user)
  end
end
