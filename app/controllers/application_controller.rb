class ApplicationController < ActionController::Base

	before_action :set_locale
	def set_locale
	  I18n.locale = :fr
	end

  protect_from_forgery with: :exception
end
