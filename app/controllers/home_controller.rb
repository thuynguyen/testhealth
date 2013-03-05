class HomeController < ApplicationController
	layout "main"
	set_tab :directory
	def index 
		@user = User.first
	end
	
	def change_locale
	  if params[:locale] == "vn"
	    
	    I18n.locale = :vn 
	    I18n.default_locale = :vn 
	  elsif params[:locale] == "en"
	    I18n.locale = :en 
	    I18n.default_locale = :en 
	  end
	end 
	
end
