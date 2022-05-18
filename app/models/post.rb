# frozen_string_literal: true

# This shiny device polishes bared foos
class Post < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 50 }

  belongs_to :user
  has_one_attached :image, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
