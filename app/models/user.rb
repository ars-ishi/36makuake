class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  has_one  :promoter_profile, dependent: :destroy
  has_many :send_addresses, dependent: :destroy
  has_one  :payment_method
  has_many :project_likes, dependent: :destroy
  has_many :projects, through: :project_likes
  has_many :direct_messages, dependent: :destroy
  has_many :projects, through: :direct_messages
  has_many :orders
  has_many :report_likes, dependent: :destroy
  has_many :report, through: :report_likes
  has_many :projects

  enum role: { admin: 0, supporter: 1, promoter: 2 }
  enum gender: { male: 1, female: 2 }

  def self.find_for_oauth(auth)
    user = User.find_by(uid: auth.uid, provider: auth.provider)

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20]
      )
    end
    user
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

end
