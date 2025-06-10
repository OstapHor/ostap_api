class SessionsController < ApiController
    def create
        user = User.find_by(email: params[:email])
        puts "===> User: #{user.inspect}"
        if user&.authenticate(params[:password])
          token = JsonWebToken.encode(user_id: user.id)
          puts "===> TOKEN: #{token}"
          render json: { token: token }, status: :ok
        else
          puts "===> AUTH FAILED"
          render json: { error: 'Невірна пошта або пароль' }, status: :unauthorized
        end
      end
  end
  