class UsersController < ApplicationController
    
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    signup_password = BCrypt::Password.create(params[:user][:pass])
    u = User.new(uid: params[:user][:uid], pass: signup_password)
    if u.save
      flash[:notice] = '登録しました。'
      redirect_to users_path
    else
      render 'new', status: :unprocessable_entity
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = '削除しました。'
      redirect_to users_path
    else
      render 'index', status: :unprocessable_entity
    end
  end
  
end
