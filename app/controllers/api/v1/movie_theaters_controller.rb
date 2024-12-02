class Api::V1::MovieTheatersController < ActionController::API  

  def show
    movie_theater = MovieTheater.find(params[:id])
    if movie_theater.nil?
      render status: 404
    end
    total_capacity = 0
    movie_theater.rooms.each do |room|
      total_capacity+= room.capacity
    end
    render status: 200, json: {name: movie_theater.name, city: movie_theater.city, total_capacity: total_capacity}    
  end
end