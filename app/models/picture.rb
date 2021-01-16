class Picture < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :delete_all
  has_one_attached :image
  
  with_options presence: true do
    validates :image
    validates :title
    validates :text
  end
end
