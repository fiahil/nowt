class Post < ActiveRecord::Base
  include PublicActivity::Common

  belongs_to :user
  has_many :tags, through: :post_tag
  has_many :post_tag

  attr_reader :tag_tokens

  def tag_tokens=(ids)
    self.tag_ids = ids.split(",")
  end
end
