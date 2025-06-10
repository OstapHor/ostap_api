class ApiController < ActionController::API
    protect_from_forgery with: :null_session
    def authorize_request
      header = request.headers['Authorization']
      header = header.split(' ').last if header
      decoded = JsonWebToken.decode(header)
      @current_user = User.find_by(id: decoded[:user_id]) if decoded
      render json: { error: 'Доступ заборонено' }, status: :unauthorized unless @current_user
    end
  end