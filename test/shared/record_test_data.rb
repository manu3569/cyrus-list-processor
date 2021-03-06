module RecordTestData

  def last_name
    "Johnson"
  end

  def first_name
    "Thomas"
  end

  def gender
    "Male"
  end

  def date_of_birth
    "1-31-1960"
  end

  def formatted_date_of_birth
    "1/31/1960"
  end

  def sortable_date_of_birth
    "1960-01-31"
  end

  def favorite_color
    "Blue"
  end

  def attributes
    {
      last_name: last_name,
      first_name: first_name,
      gender: gender,
      date_of_birth: date_of_birth,
      favorite_color: favorite_color
    }
  end

  def pipe_delimited_columns
    [:last_name, :first_name, nil, :gender, :favorite_color, :date_of_birth]
  end

  def comma_delimited_columns
    [:last_name, :first_name, :gender, :favorite_color, :date_of_birth]
  end

  def space_delimited_columns
    [:last_name, :first_name, nil, :gender, :date_of_birth, :favorite_color]
  end

  def ordered_by_last_name
    %w(Smith Seles Kournikova Kelly Hingis Bouillon Bonk Bishop Abercrombie)
  end

  def last_name_order_regex
    Regexp.new(ordered_by_last_name.join(".*"), Regexp::MULTILINE)
  end

  def ordered_by_date_of_birth
    %w(Abercrombie Kelly Bishop Seles Bouillon Bonk Kournikova Hingis Smith)
  end

  def date_of_birth_order_regex
    Regexp.new(ordered_by_date_of_birth.join(".*"), Regexp::MULTILINE)
  end

  def ordered_by_gender
    %w(Hingis Kelly Kournikova Seles Abercrombie Bishop Bonk Bouillon Smith)
  end

  def gender_order_regex
    Regexp.new(ordered_by_gender.join(".*"), Regexp::MULTILINE)
  end

  def pipe_delimited_records_list
    [ 
      Record.new({ last_name: 'Smith', first_name: 'Steve', gender: 'M', favorite_color: 'Red', date_of_birth: '3-3-1985' }),
      Record.new({ last_name: 'Bonk', first_name: 'Radek', gender: 'M', favorite_color: 'Green', date_of_birth: '6-3-1975' }),
      Record.new({ last_name: 'Bouillon', first_name: 'Francis', gender: 'M', favorite_color: 'Blue', date_of_birth: '6-3-1975' })
    ]
  end

  def comma_delimited_records_list
    [
      Record.new({ last_name: 'Abercrombie', first_name: 'Neil', gender: 'Male', favorite_color: 'Tan', date_of_birth: '2/13/1943' }),
      Record.new({ last_name: 'Bishop', first_name: 'Timothy', gender: 'Male', favorite_color: 'Yellow', date_of_birth: '4/23/1967' }),
      Record.new({ last_name: 'Kelly', first_name: 'Sue', gender: 'Female', favorite_color: 'Pink', date_of_birth: '7/12/1959' })
    ]
  end

  def space_delimited_records_list
    [
      Record.new({ last_name: 'Kournikova', first_name: 'Anna', gender: 'F', date_of_birth: '6-3-1975', favorite_color: 'Red' }),
      Record.new({ last_name: 'Hingis', first_name: 'Martina', gender: 'F', date_of_birth: '4-2-1979', favorite_color: 'Green' }),
      Record.new({ last_name: 'Seles', first_name: 'Monica', gender: 'F', date_of_birth: '12-2-1973', favorite_color: 'Black' })
    ]
  end

  def record_files
    ["--pipe=test/data/pipe.txt", "--comma=test/data/comma.txt", "--space=test/data/space.txt"]
  end

end