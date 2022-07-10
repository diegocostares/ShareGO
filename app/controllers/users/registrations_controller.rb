module Users
  class RegistrationsController < Devise::RegistrationsController
    # Añadimos los nuevos parámetros para que devise permita agregarlos a los datos de usuario.
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
    end

    # Añadimos los nuevos parámetros para que devise permita actualizar los datos de usuario.
    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, 
                                        keys: %i[first_name last_name remember_me])
    end
  end
end
