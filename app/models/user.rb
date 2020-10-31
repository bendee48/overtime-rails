class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :audit_logs
  
  has_many :hands_associations, class_name: 'Hand'
  has_many :hands, through: :hands_associations

  validates_presence_of :first_name, :last_name, :phone
  
  PHONE_REGEX = /\A\d+\z/
  validates :phone, format: { with: PHONE_REGEX }, length: { is: 11 }

  def full_name
    "#{last_name.upcase}, #{first_name}"
  end
end
