class UsersController < ApplicationController
    
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(uid: params[:user][:uid], pass: params[:user][:pass])
    if @user.save
      flash[:notice] = '登録しました。'
      redirect_to root_path
    else
      render 'new', status: :unprocessable_entity
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = '削除しました。'
      redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end
  
end
