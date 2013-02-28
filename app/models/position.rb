class Position < ActiveRecord::Base
  attr_accessible :address, :email, :name, :phone, :map
  has_attached_file :map, :styles => { :small => "88x88#",:medium => "200x200#" }, 
                   :storage => :s3,
                   :s3_credentials => "#{Rails.root}/config/amazon_s3.yml",
                   :default_url => 'default-avatar.jpeg',
                   :path => "photos/:id/:style.:extension"
  #validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :map, :content_type => [ 'image/jpeg', 'image/jpg', 'image/png' ],
                                    :message => I18n.t("common.error_photo_file_type")

end
