class Sub < ApplicationRecord
  validates :title, :moderator, presence: true

  belongs_to :moderator,
  foreign_key: :user_id,
  class_name: 'User'

  has_many :post_subs, dependent: :destroy
  has_many :posts, through: :post_subs

end
