class TweetsController < ApplicationController
    
  def index
    @tweets = Tweet.all.order(message: :desc)
  end
  
  def new
    @tweet = Tweet.new
  end
  
  def create
    t = Tweet.new(message: params[:tweet][:message])
    t.user = User.find_by(uid: session[:login_uid])
    if t.save
      flash[:notice] = 'つぶやきました。'
      redirect_to tweets_path
    else
      @tweet = t
      render 'new', status: :unprocessable_entity
    end
  end
  
  def destroy
    @tweet = Tweet.find(params[:id])
    if @tweet.destroy
      flash[:notice] = '削除しました。'
      redirect_to tweets_path
    else
      render 'index', status: :unprocessable_entity
    end
  end
  
end