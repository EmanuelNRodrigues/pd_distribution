# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           not null
#  encrypted_password     :string           not null
#  is_admin               :boolean          default(FALSE)
#  jti                    :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_jti                   (jti) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :addresses, class_name: 'AddressInformation', as: :addressable, dependent: :delete_all
  has_many :orders, dependent: :delete_all
  validates :email, uniqueness: { case_sensitive: false, message: 'O Email já se encontra atribuído' }

  # Method to remove email requirement on Devise
  def email_required?
    false
  end

  # Method to remove email requirement on Devise
  def email_changed?
    false
  end

  def generate_jwt
    JWT.encode({ id:, exp: 60.days.from_now.to_i },
               Rails.application.secrets.secret_key_base)
  end
end
