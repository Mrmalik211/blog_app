class Post < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 50 }

  belongs_to :user
  has_one_attached :image, :dependent => :destroy
  has_many :comments, dependent: :destroy
end
