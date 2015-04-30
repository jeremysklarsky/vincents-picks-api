json.critics @critics do |critic|
  json.name           critic.name
  json.average_score  critic.avg_score
  json.publications   critic.publications.collect{|p|p.name}  
  json.link           "http://localhost:3000/api/critics/#{critic.slug}"

end

