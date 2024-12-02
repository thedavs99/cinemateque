class ActorsController < ApplicationController
  def new 
    @actor = Actor.new
  end

  def create
    @actor = Actor.new(name: params[:name] )
    if @actor.save
      redirect_to @actor, notice: 'ator cadastrado com sucesso'
    else
      redirect_to root_path
    end
  end

  def show
    @actor = Actor.find(params[:id])
    @movies = Movie.all    
  end
end