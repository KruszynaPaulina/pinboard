class Pin < ActiveRecord::Base
    belongs_to :user
    has_attached_file :image, :styles => { :large => "1000x1000>", :medium => "300x300>", :thumb => "100x100>" }
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
    has_many :coms
    has_many :likes, dependent: :destroy
    has_many :liked_useres, through: :likes, source: :users
end
