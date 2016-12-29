class CalendarController < ApplicationController

  before_action :set_locale
  def set_locale
    I18n.locale = :fr
  end

  skip_before_action :require_login

  def calendrier
  	  @seances = Seance.all
  	  @films = Film.all
  	  @villages = Village.all
  	  lieu = params[:lieu]
  	  @date = params[:date] ? Date.parse(params[:date]) : Date.today
  	end
end
