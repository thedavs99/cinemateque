require 'rails_helper'

describe 'Movie Theater API' do
  context '/api/v1/movie_theaters/1' do
    it 'success' do
      movie_theater = MovieTheater.create!(name: 'Cinema São Paulo', city: 'São Paulo')
      Room.create!(name: 'Sala A', capacity: 120, movie_theater: movie_theater)
      Room.create!(name: 'Sala B', capacity: 110, movie_theater: movie_theater)
      Room.create!(name: 'Sala C', capacity: 100, movie_theater: movie_theater)

      get "/api/v1/movie_theaters/#{movie_theater.id}"

      expect(response.status).to eq 200
      expect(response.content_type).to include 'application/json'
      json_response = JSON.parse(response.body)
      expect(json_response).to include 'Cinema São Paulo'
    end
  end
end