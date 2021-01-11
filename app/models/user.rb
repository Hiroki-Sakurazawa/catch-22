class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    validates :nickname,       presence: true, format: { with: /\A[a-z0-9ぁ-んァ-ン一-龥]+\z/ }, length: { maximum: 8 }
    validates :password,       format: { with: /\A[a-z0-9]+\z/i }
end
