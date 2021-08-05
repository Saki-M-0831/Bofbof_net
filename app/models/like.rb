class Like < ApplicationRecord
  belongs_to :user
  belongs_to :object, polymorphic: true
  default_scope { order(created_at: :desc) }
end
