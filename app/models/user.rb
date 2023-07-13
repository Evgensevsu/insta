class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  followability
  has_many :posts
  has_many :comments
  has_many :likes

  def unfollow(user)
    followerable_relationships.where(followable_id: user.id).destroy_all
  end

  def follow(user)
  end
end
