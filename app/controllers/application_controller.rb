class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :set_locale
  helper_method :current_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  def current_locale
    params[:locale] || I18n.locale
  end	
end
