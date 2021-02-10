class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :first_name,       format: {with: /\A[ぁ-んァ-ン一-龥々]/, message: "Full-width characters"}
    validates :name,             format: {with: /\A[ぁ-んァ-ン一-龥々]/, message: "Full-width characters"}
    validates :first_name_kana,  format: {with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
    validates :name_kana,        format: {with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
    validates :birth_day
  end
    validates :password,:password_confirmation,format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/}

    has_many :user
end
