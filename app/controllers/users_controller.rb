class UsersController < ApplicationController

  before_filter :per_load
  def per_load
    @user = User.find_by_id(params[:id])
  end

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to :action=>:index
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to :action=>:show,:id=>params[:id]
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

end
