# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  include RackSessionsFix
  respond_to :json

  private

  def respond_with(_current_user, _opts = {})
    current_token = request.env['warden-jwt_auth.token']
    render json: { token: current_token },
           status: :ok
  end

  def respond_to_on_destroy
    if request.headers['Authorization'].present?
      jwt_payload = JWT.decode(request.headers['Authorization'].split(' ').last,
                               Rails.application.credentials.devise_jwt_secret_key!).first
      current_user = User.find(jwt_payload['sub'])
    end

    if current_user
      render status: :ok,
             json: { message: 'Logged out successfully.' }
    else
      render status: :unauthorized,
             json: { message: "Couldn't find an active session." }
    end
  end
end
