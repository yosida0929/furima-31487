class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname,            presence: true
    validates :first_name,          presence: true
    validates :name,                presence: true
    validates :first_name_kana,     presence: true
    validates :name_kana,           presence: true
    validates :birth_day,           presence: true
  end
      with_options presence: true, format: { with: /\A[a-z\d]+\z/i, message: '半角英数字を使用してください' } do
        validates :password,          presence: true
    end

    has_many :items
    has_many :buyers
end
