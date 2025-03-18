class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:prenom, :nom, :pseudo, :poids, :taille, :age,
                                    :sexe, :objectif_physique, :objectif_calorique, :regimes_alimentaires])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:prenom, :nom, :pseudo, :poids, :taille, :age,
                                    :sexe, :objectif_physique, :objectif_calorique, :regimes_alimentaires])
  end
end
