class RolesController < ApplicationController
  def create
    @actor = Actor.find[params[:actor_id]]
    @role = Role.new( name: params[:name], movie_id: params[:movie_id] )
    @role.actor = @actor
    if @role.save
      redirect_to @actor
    end
  end
end