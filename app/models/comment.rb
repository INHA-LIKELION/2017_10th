class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  paginates_per 20
end
