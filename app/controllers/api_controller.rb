class ApiController < ActionController::Api
    protect_from_forgery with: :null_session
end
