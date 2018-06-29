class DosesController < ApplicationController

  def new
    @dose = Dose.new
    @ingredients = Ingredient.all
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @ingredient = Ingredient.find(params["dose"]["ingredient"].to_i)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @dose.ingredient = @ingredient
    if @dose.save
      redirect_to cocktail_path(params[:cocktail_id])
    else
      redirect_to new_cocktail_dose_path(params[:cocktail_id])
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    @cocktail = @dose.cocktail
    redirect_to cocktail_path(@cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description)
  end


end
