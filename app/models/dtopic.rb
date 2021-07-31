class Dtopic < ApplicationRecord
  belongs_to :post

  validates :content, presence: true, length: { maximum: 42 }
end
