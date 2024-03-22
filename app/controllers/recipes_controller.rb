class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @url = Recipe.find(params[:id]).url
    @recipe = Recipe.find(params[:id])
    url = @url
    @ogp_info = Recipe.fetch_ogp_info(url)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :item, :url, :step, :note).merge(user_id: current_user.id)
  end

end
