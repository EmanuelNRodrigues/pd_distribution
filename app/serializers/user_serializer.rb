# frozen_string_literal: true

# Serializers for Users Model

class UserSerializer
  class << self
    def single(user, with_jti: false)
      return user.slice(:id, :email, :jti) if with_jti

      user.slice(:id, :email)
    end
  end
end
