class Post < ApplicationRecord
  has_many :dtopics, dependent: :destroy
  has_many :itopics, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, as: :object, dependent: :destroy

  validates :title, presence: true
end
