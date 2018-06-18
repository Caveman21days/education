require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  check_authorization unless: :devise_controller?

  protect_from_forgery with: :exception

  respond_to :html


  rescue_from CanCan::AccessDenied do |e|
    respond_to do |format|
      format.html { redirect_to root_url, alert: e }
      format.json { render json: { errors: e.message }, status: :forbidden }
      format.js   { head :forbidden }
    end
  end
end
