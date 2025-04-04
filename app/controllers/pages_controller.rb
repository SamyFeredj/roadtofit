class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @user = current_user
    # 5 meilleures recettes
    @best_recettes = best_recettes
    # recettes de l'utilisateur pour aujourd'hui
    @choix_recettes = ChoixRecette.where(user: @user, date: Date.today.beginning_of_day..Date.today.end_of_day)
    @user_recettes = Recette.where(
      id: @choix_recettes.pluck(:recette_id)
      )
    # Calcul des calories restantes pour aujourd'hui
    # TODO : OBJECTIF CALORIQUE NE DOIT PAS ETRE NIL
    # @daily_cal = @user.objectif_calorique
    @daily_cal = 2000
    recettes_made = Recette.where(
      id: @choix_recettes.select { |choix| choix.done }.map { |recette| recette.recette_id }
    )
    daily_cal_consumed = recettes_made.sum(:calories)
    @proteines = recettes_made.sum(:proteines)
    @lipides = recettes_made.sum(:lipides)
    @glucides = recettes_made.sum(:glucides)
    @daily_cal_left = @daily_cal - daily_cal_consumed
  end

  private

  def best_recettes
    Recette.order(note_globale: :desc).limit(5)
  end
end
