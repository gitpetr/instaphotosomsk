class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def set_locale
     I18n.locale = extract_locale_from_accept_language_header
  end

  private

  def extract_locale_from_accept_language_header

     http_accept_language = request.env['HTTP_ACCEPT_LANGUAGE']

     if http_accept_language
        case http_accept_language.scan(/^[a-z]{2}/).first
           when 'en'
                    'en'
           when 'ru'
                    'ru'
           else
                    'ru'
           end
        else
           'ru'
        end
  end






protected

def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
end
end
