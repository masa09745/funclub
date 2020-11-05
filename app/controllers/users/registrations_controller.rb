class Users::RegistrationsController < Devise::RegistrationsController

  def step1
    @user = User.new
  end

  def step2
    session[:user] = user_params
    @user = User.new
  end

  def step3

  end

  def final
    @user = User.new(session[:user])

    if @user.save!
      session[:id] = @user.id
      sign_in User.find(session[:id]) unless user_signed_in?
      session[:user].clear
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :name_kana, :email, :password)
  end
end
