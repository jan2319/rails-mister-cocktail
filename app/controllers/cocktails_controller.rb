class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.search(params[:term])
    @term = params[:term]
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = Dose.where(cocktail_id: params[:id])
    @reviews = Review.where(cocktail_id: params[:id])
    @ingredients = Ingredient.all
    @review = Review.new
    @dose = Dose.new
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :term)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

end
