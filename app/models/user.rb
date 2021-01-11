class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname,       format: { with: /\A[a-z0-9ぁ-んァ-ン一-龥]+\z/ }, length: { maximum: 8 }
    validates :password,       format: { with: /\A[a-z0-9]+\z/i }
  end
end
