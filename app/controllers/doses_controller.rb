class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    @cocktail = @dose.cocktail
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render "new"
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy!
    @cocktail = @dose.cocktail
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end
