class HomeController < ApplicationController
	layout "main"
	set_tab :directory
	def index 
		@user = User.first
	end
end