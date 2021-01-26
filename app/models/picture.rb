class Picture < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :delete_all
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  is_impressionable  counter_cache: true

  with_options presence: true do
    validates :image
    validates :title
    validates :text
  end

  validates :genre_id, numericality: { other_than: 0 }

  def self.search(search)
    if search != ''
      Picture.where('title LIKE(?)', "%#{search}%").or(Picture.where('text LIKE(?)', "%#{search}%"))
    else
      Picture.all
    end
  end
end
