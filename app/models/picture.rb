class Picture < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :delete_all
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  validates :genre_id, numericality: { other_than: 0 }

  with_options presence: true do
    validates :image
    validates :title
    validates :text
  end

  def self.search(search)
    if search != ''
      Picture.where('title LIKE(?)', "%#{search}%").or(Picture.where('text LIKE(?)', "%#{search}%"))
    else
      Picture.all
    end
  end
end
