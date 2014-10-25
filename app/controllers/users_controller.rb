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
  		flash[:notice] = "Successfully created subdomain"
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
#    @user = User.find(params[:subdomain])
#    if @user.update_attributes(params[:user])
#      redirect_to @user
#    else
     redirect_to @user
  end
end
