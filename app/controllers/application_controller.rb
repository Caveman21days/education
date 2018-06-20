require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery with: :exception

  before_action :authenticate_user!

  check_authorization unless: :devise_controller?


  rescue_from CanCan::AccessDenied do |e|
    respond_to do |format|
      format.html { redirect_to root_url, alert: e }
      format.json { render json: { errors: e.message }, status: :forbidden }
      format.js   { head :forbidden }
    end
  end
end
