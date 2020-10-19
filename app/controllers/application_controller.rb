class ApplicationController < ActionController::Base
  before_action :basic_auth
  protect_from_forgery with: :exeption


  private

  def basic_auth
    authenticate_request_with_thhp_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
