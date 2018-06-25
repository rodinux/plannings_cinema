class UserMailer < ApplicationMailer
	default from: 'notifications@programme.ecranvillage.deploiement.ovh'

  def bienvenue_email
    @user = params[:user]
    @url  = 'https://programme.ecranvillage.deploiement.ovh/log_in'
    mail(to: @user.email, subject: 'Bienvenue sur cette application')
  end
end
