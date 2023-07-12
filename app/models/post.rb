class Post < ApplicationRecord
    validates :title, presence: true, length: {minimum: 5, maximum: 50}
    validates :description, presence: true, length: {minimum: 2, maximum: 250}
    validates :keywords, presence: true, length: {minimum: 5, maximum: 50}
    has_many_attached :images
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    belongs_to :user
end
