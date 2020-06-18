class RecipesController < ApplicationController

  def new 
    @recipe = Recipe.new 
  end 

  def create 
    @recipe = Recipe.new(recipe_params)

    if @recipe.save 
      redirect_to recipes_path(@recipe)    
    else
     @errors = @recipe.errors.full_messages
     render :new
    end
  end 

  def index 
    @recipes = Recipe.all 
  end 

  def show 
    @recipe = Recipe.find(params[:id])
  end 

  def edit 
    @recipe = current_user.recipes.find(params[:id])
  end 

  def update 
    @recipe = current_user.recipes.find(params[:id])

    if @recipe.update_attributes(recipe_params)
      redirect_to recipe_path(@recipe), notice: "Recipe Updated"
    else    
      @errors = @recipe.errors.full_messages 
      render :edit 
    end 
  end 

  def destroy 
    recipe = Recipe.find(params[:id])
    recipe.destroy 
    redirect_to recipes_path, notice: "Deleted Recipe #{recipe.title}"
  end

  private 

  def recipe_params 
    params.require(:recipe).permit(:title, :description, :level, :serves, :image)
  end 

end 
