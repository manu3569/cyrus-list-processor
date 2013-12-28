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
    "1960-12-31"
  end

  def formatted_date_of_birth
    "12/31/1960"
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

  def records_list
    [ Record.new(attributes) ]
  end

  def comma_separated_file_contents
    "#{last_name}, #{first_name}, M, #{gender}, #{date_of_birth}, #{favorite_color}"
  end

end