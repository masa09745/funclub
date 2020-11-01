# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  def menu
  end

  def step1
    @user = User.new
  end

  def step2
    session[:user] = user_params
    @user = User.new
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
