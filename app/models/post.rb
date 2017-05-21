class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user

  paginates_per 5
end
