class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts

  validates_presence_of :first_name, :last_name, :phone
  
  PHONE_REGEX = /\A\d+\z/
  validates :phone, format: { with: PHONE_REGEX }, length: { is: 11 }

  def full_name
    "#{last_name.upcase}, #{first_name}"
  end
end
