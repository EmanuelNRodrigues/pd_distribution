
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
