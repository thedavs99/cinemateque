class ActorsController < ApplicationController
  def new 
    @actor = Actor.new
  end

  def create
    @actor = Actor.new(params[:id])
    if @actor.save
      redirect_to @actor
    end
  end

  def show
    @movies = Movie.all
    @actor = Actor.find(params[:id])
  end
end