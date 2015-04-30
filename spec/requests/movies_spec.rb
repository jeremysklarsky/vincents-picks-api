require 'rails_helper'

RSpec.describe "Movies", type: :request do
  describe "GET /movies" do

    before(:each) do
      Movie.create(:name => "Star Wars")
    end

    it "has a route" do
      get api_movies_path
      expect(response).to have_http_status(200)
    end

    it "displays movies in the collection" do
      get api_movies_path
      expect(response.body).to include("Star Wars")
    end
  end

  describe "GET /movies/movie" do
    before(:each) do
      @movie = Movie.create(:name => "Star Wars")
      get api_movie_path(@movie)
    end

    it "has a route" do
      expect(response).to have_http_status(200)
    end

    it "displays the movie's info" do 
      expect(response.body).to include("Star Wars")
    end
  end

end
