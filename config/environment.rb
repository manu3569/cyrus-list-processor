ALLOWED_ATTRIBUTES = [:last_name, :first_name, :gender, :date_of_birth, :favorite_color]

PIPE_DELIMITED_COLUMNS  = [:last_name, :first_name, nil, :gender, :favorite_color, :date_of_birth]
COMMA_DELIMITED_COLUMNS = [:last_name, :first_name, :gender, :favorite_color, :date_of_birth]
SPACE_DELIMITED_COLUMNS = [:last_name, :first_name, nil, :gender, :date_of_birth, :favorite_color]


require 'Date'

# Load all files in lib
Dir["lib/*.rb"].each do |file|
  require File.basename(file)
end
