class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  skip_before_action :authorized, only: [:index, :create ] 
  before_action :set_user, only: [:show, :update, :destroy ]

  # GET /users
  def index
    @users = User.all

    render json: @users, :except => [:created_at, :updated_at]
  end

  # GET /users/1
  def show
   if @user
     render json: @user
   else 
    render json: "Username not found", status: :unprocessable_entity
   end
  end

  # POST /users
  def create
    @user = User.create!(user_params) 
   
    if @user.valid? && @user.id
      @token = encode_token({ user_id: @user.id })
      render json: {user: @user, token: @token}, status: :created 
    else
    
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # def create
  #   user = User.create(user_params)
  #    if user.valid?
  #      session[:user_id] = user.id
  #      render json: user, status: :created
  #    else
  #      render json: user.errors, status: :unprocessable_entity
  #    end
  #  end

  # PATCH/PUT /users/1
  def update
    if @user.update!(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end

    def record_invalid(invalid)
      render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity 
  end

  def record_not_found(error)
      render json: {error: error.msg}, status: :unprocessable_entity
  end

end
