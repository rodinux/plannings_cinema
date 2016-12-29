class ApplicationController < ActionController::Base

	before_action :set_locale
	def set_locale
	  I18n.locale = :fr
	end

	before_action :require_login

  protect_from_forgery with: :exception
end
