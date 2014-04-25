class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @titre = "S'inscrire"
  end
end
