# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  def menu
  end

  def step1
    @user = User.new
  end

  def step2
    session[:name] = user_params[:name]
    session[:name_kana] = user_params[:name_kana]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
  end

  def final
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :name_kana,
      :email,
      :password
    )
  end


end
