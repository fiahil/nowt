class Tag < ActiveRecord::Base
  has_many :posts, through: :post_tag
  has_many :post_tags

  has_many :users, through: :user_tag
end
