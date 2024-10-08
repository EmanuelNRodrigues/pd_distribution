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
class UserSerializer
  class << self
    def single(user, with_jti: false)
      return user.slice(:id, :email, :jti) if with_jti

      user.slice(:id, :email)
    end

    def addresses(addresses)
      addresses.map do |address|
        address.slice(:id, :address1, :address2, :city, :name, :postal_code1, :postal_code2)
      end
    end
  end
end
