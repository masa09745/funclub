class Users::RegistrationsController < Devise::RegistrationsController
  require "payjp"

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

    Payjp.api_key = Rails.application.credentials.dig(:payjp, :secret_access_key)

    if params[:payjp_token].present?
      @customer = Payjp::Customer.create(
        description: 'FunClub',
        email: session[:user][:email],
        card: params[:payjp_token]
      )
    else
      render :step3
    end

    @user = User.new(session[:user])
    @user.cards.build(
      user_id: @user.id,
      customer: @customer.id,
      card: @customer.default_card
    )
    if @user.save!
      session.clear
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
