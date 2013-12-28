# Load all files in lib
Dir["lib/*.rb"].each do |file|
  require File.basename(file)
end
