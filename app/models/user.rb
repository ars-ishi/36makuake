class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one  :promoter_profile, dependent: :destroy
  has_many :send_addresses, dependent: :destroy
  has_one  :payment_method
  has_many :project_likes, dependent: :destroy
  has_many :projects, through: :project_likes
  has_many :direct_messages, dependent: :destroy
  has_many :projects, through: :direct_messages
  has_many :orders, dependent: :destroy
  has_many :report_likes, dependent: :destroy
  has_many :report, through: :report_likes
end
