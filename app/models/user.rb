class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :child_birthday
    validates :parent_birthday

   with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
    validates :child_name
    validates :parent_name
  end
  
   with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :child_name_kana
    validates :parent_name_kana
  end

end

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }

  has_many :lectures
  has_many :studies
  has_one  :address

end
