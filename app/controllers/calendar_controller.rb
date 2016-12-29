class CalendarController < ApplicationController

  before_action :set_locale
  def set_locale
    I18n.locale = :fr
  end

  def calendrier
  	  @seances = Seance.all
  	  @films = Film.all
  	  @villages = Village.all
  	  lieu = params[:lieu]
  	  @date = params[:date] ? Date.parse(params[:date]) : Date.today
  	end
end
