class ApplicationController < ActionController::Base

	before_action :set_locale
	def set_locale
	  I18n.locale = :fr
	end

before_action :require_login

  rescue_from CanCan::AccessDenied do |exception|
  redirect_to main_app.root_path, :alert => exception.message
   # Rails.logger.debug "Access denied on #{exception.action} #{exception.subject.inspect}"
  end

  def current_ability
   @current_ability ||= Ability.new(current_user)
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

 private
  # Overwrite the method sorcery calls when it
    # detects a non-authenticated request.
    def not_authenticated
      # Make sure that we reference the route from the main app.
      redirect_to main_app.log_in_path
    end

    def allow_iframe
      response.headers.delete "X-Frame-Options"
      response.headers["Access-Control-Allow-Origin"] = "*"
    end
end