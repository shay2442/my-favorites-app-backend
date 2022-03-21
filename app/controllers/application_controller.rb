
   
class ApplicationController < ActionController::API
    include ActionController::Cookies
    before_action :authorized
      rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
      rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  
    def encode_token(payload)
      JWT.encode(payload, ENV['JWT_SECRET'])
    end
  
    def auth_header
      request.headers['Authorization']
    end
  
    def decoded_token
      if auth_header
        token = auth_header.split(' ')[1]
        # headers: { 'Authorization': 'Bearer <token>' }
        begin
          JWT.decode(token, ENV['JWT_SECRET'], true, algorithm: ENV['JWT_ALGORITHM'])
          # JWT.decode => [{ "beef"=>"steak" }, { "alg"=>"HS256" }]
        rescue JWT::DecodeError
          nil
        end
      end
    end
  
    def current_user 
      if decoded_token
        user_id = decoded_token[0]['user_id']
        @user = User.find_by(id: user_id)
      end
    end
  
    def logged_in? 
      !!current_user
    end
  
    def authorized
      render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end

    private

  def record_invalid(invalid)
    render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end

  def record_not_found(error)
    render json: {error: error.msg}, status: :not_found
  end
  
  end 