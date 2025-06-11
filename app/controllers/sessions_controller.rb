class SessionsController < ApiController
  skip_before_action :authorize_request

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: user.id)
      render json: { token: token }, status: :ok
    else
      render json: { error: 'Невірна пошта або пароль' }, status: :unauthorized
    end
  end
end
