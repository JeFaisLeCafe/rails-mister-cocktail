class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to @cocktail
    else
      render :new
    end
  end

  def latest
    @cocktails = Cocktail.last(5)
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
  # before_action :set_garden, only: [:show, :edit, :update, :destroy]

  # def index
  #   @gardens = Garden.all
  # end

  # def show
  #   @plant = Plant.new
  # end

  # def new
  #   @garden = Garden.new
  # end

  # def edit
  # end

  # def create
  #   @garden = Garden.new(garden_params)
  #   if @garden.save
  #     redirect_to @garden
  #   else
  #     render :new
  #   end
  # end

  # def update
  #   if @garden.update(garden_params)
  #     redirect_to @garden
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @garden.destroy
  #   redirect_to gardens_url
  # end

  # private
  # def set_garden
  #   @garden = Garden.find(params[:id])
  # end

  # def garden_params
  #   params.require(:garden).permit(:name, :banner_url)
  # end
end
