class Users::RegistrationsController < ApplicationController
  def cancel
    super
  end

  def create
    super
  end

  def new
    super
  end

  def edit
    super
  end

  def update
    super
  end

  def destroy
    super
  end

  def build_resource(hash=nil)
    hash[:uid] = User.create_unique_string
    super
  end
end
