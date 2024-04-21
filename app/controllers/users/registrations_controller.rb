# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  include RackSessionsFix
  respond_to :json

  private

  def respond_with(current_user, _opts = {})
    if resource.persisted?
      render status: :ok,
             json: UserSerializer.single(current_user, with_jti: false)
    else
      render status: :unprocessable_entity,
             json: { message: resource.errors.first.message }
             
    end
  end
end
