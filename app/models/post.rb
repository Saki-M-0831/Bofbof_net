class Post < ApplicationRecord
  has_many :dtopics, dependent: :destroy
  has_many :itopics, dependent: :destroy
end
