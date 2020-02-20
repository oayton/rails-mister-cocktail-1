class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :show, :create]

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.ingredient_id = params[:dose][:ingredient_id]
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    # @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.find(params[:id])
    @dose.delete
    redirect_to root_path
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
