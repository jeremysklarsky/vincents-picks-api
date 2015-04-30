json.movies @movies do |movie|
  json.name         movie.name
  json.release_date movie.release_date
  json.summary      movie.summary
  json.score        movie.score
  json.genres       movie.genres.collect{|g|g.name}  
end

