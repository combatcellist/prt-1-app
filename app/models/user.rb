class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :items, dependent: :destroy
    has_one  :profile, dependent: :destroy

    delegate :name, :detail, :image, to: :profile
end
