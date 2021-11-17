class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :likes, as: :object, dependent: :destroy

  validates :content, presence: true
end
