class ResetPasswordsController < ApplicationController
    skip_before_action :require_login

    def new
    end

    def create
      @user = User.find_by_email(params[:email])
      @user.deliver_reset_password_instructions! if @user
      redirect_to log_in_path, notice: 'Des instructions vous ont été envoyées sur votre courriel.'
    end

    def edit
      @token = params[:id]
      @user = User.load_from_reset_password_token(@token)

      not_authenticated if @user.blank?
    end

    def update
      @token = params[:id]
      @user = User.load_from_reset_password_token(@token)

      not_authenticated && return if @user.blank?

      @user.password_confirmation = params[:user][:password_confirmation]
      if @user.change_password!(params[:user][:password])
        redirect_to log_in_path, notice: 'Mot de passe mis à jour avec succès.'
      else
        render "edit"
      end
    end
end