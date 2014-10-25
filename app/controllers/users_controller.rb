class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user?, :except => [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  	@user =Users.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		flash[:notice] = "Successfully created account"
  		redirect_to @user
  	else
  		render :action => 'new'
  	end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    redirect_to @user
  end
end
