class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  paginates_per 3

  acts_as_likeable
end
