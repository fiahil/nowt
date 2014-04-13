class Post < ActiveRecord::Base
  include PublicActivity::Common

  acts_as_commontable
  
  belongs_to :user
  has_many :tags, through: :post_tag
  has_many :post_tag

  has_attached_file :picture,
    use_timestamp: false,
    preserve_files: true,
    styles: {:medium => "500x500#", :thumb => "100x100#"},
    default_url: "http://placehold.it/300x300/bbb/&text=Your%20Logo",
    url: "/pictures/:id/:style_:hash.:extension",
    hash_secret: "dTh5NzZ0NXI0ZTN3ZTdTh5NzZ0NXI0ZTN3ZTU0eSBnaGprcG9sLDtt",
    storage: :s3,
    s3_credentials: "#{Rails.root}/config/s3.yml"

  validates_attachment :picture,
    content_type: { content_type: /^image\/(jpg|jpeg|pjpeg|png|x-png)$/ },
    size: { in: 0..1.megabytes }

  attr_reader :tag_tokens

  def tag_tokens=(ids)
    self.tag_ids = ids.split(",")
  end

  # validations
  validates :title, presence: true
  validates :description, presence: true
end
