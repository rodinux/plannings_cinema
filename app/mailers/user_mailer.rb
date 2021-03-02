class UserMailer < ApplicationMailer
  default from: 'notifications@programme.ecranvillage.net'

  def bienvenue_email(user)
    @user = user
    @url  = 'https://programme.ecranvillage.net/log_in'
    mail(to: @user.email, subject: 'Bienvenue sur le planning des séances Écran Village')
  end

  def reset_password_email(user)
    @user = user
    @url  = edit_reset_password_url(@user.reset_password_token)
    mail(to: user.email,
         subject: "Votre mot de passe a été réinitialisé")
  end
end