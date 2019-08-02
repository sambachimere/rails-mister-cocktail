class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    @ingredient = Ingredient.find(params[:dose][:ingredient_id])
    @dose.ingredient = @ingredient
    # raise
    @dose.save
    redirect_to @dose.cocktail
  end

  def destroy
    @dose = Dose.find(params[:cocktail_id][:id])
    @dose.delete
  end

  private

  def dose_params
    params.require(:dose).permit(:description)
  end
end
