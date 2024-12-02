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
      expect(json_response["name"]).to eq 'Cinema São Paulo'
      expect(json_response["city"]).to eq 'São Paulo'
      expect(json_response["total_capacity"]).to eq 330
    end

    it 'diferents cinemas' do
      movie_theater = MovieTheater.create!(name: 'Cinema São Paulo', city: 'São Paulo')
      movie_theater_b = MovieTheater.create!(name: 'Cinema David', city: 'São Paulo')
      Room.create!(name: 'Sala A', capacity: 120, movie_theater: movie_theater)
      Room.create!(name: 'Sala B', capacity: 110, movie_theater: movie_theater_b)
      Room.create!(name: 'Sala C', capacity: 100, movie_theater: movie_theater)

      get "/api/v1/movie_theaters/#{movie_theater.id}"

      expect(response.status).to eq 200
      expect(response.content_type).to include 'application/json'
      json_response = JSON.parse(response.body)
      expect(json_response["name"]).to eq 'Cinema São Paulo'
      expect(json_response["city"]).to eq 'São Paulo'
      expect(json_response["total_capacity"]).to eq 220
    end

    it 'not found' do
      get "/api/v1/movie_theaters/999999"

      expect(response.status).to eq 404
    end

    it 'internal error' do
      movie_theater = MovieTheater.create!(name: 'Cinema São Paulo', city: 'São Paulo')
      allow(MovieTheater).to receive(:find).and_raise(ActiveRecord::ActiveRecordError) 

      get "/api/v1/movie_theaters/#{movie_theater.id}"

      expect(response.status).to eq 500
    end
  end
end