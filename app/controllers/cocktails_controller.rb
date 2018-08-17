class CocktailsController < ApplicationController
  def index
    if params[:search]
      @search = params[:search].downcase
      @cocktails = Cocktail.where('lower(name) LIKE ?', "%#{@search}%")
    else
      @cocktails = Cocktail.all
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/new"
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy!
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
