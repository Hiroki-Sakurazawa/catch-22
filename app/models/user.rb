class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :pictures
  has_many :comments
  validates :user_name,       presence: true, format: { with: /\A[a-z0-9ぁ-んァ-ン一-龥]+\z/ }, length: { maximum: 6 }
  validates :password,       format: { with: /\A[a-z0-9]+\z/i }
end
