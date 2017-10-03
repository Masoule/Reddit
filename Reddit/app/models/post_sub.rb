class PostSub < ApplicationRecord
  validates :post, :sub, presence: true

   belongs_to :sub
   belongs_to :post
end
