class Record

  attr_reader *ALLOWED_ATTRIBUTES

  def initialize(attributes)
    set_allowed_attributes(attributes)
    format_date_of_birth
  end

  def ==(other_record)
    ALLOWED_ATTRIBUTES.all? do |attribute|
      self.send(attribute) == other_record.send(attribute)
    end
  end

  def sortable_date_of_birth
    @date_of_birth.strftime('%Y-%m-%d') if ALLOWED_ATTRIBUTES.include?(:date_of_birth)
  end

  def date_of_birth
    @date_of_birth.strftime('%-m/%-d/%Y') if ALLOWED_ATTRIBUTES.include?(:date_of_birth)
  end

  def to_s
    ALLOWED_ATTRIBUTES.inject("") do |row, column|
      row << " #{self.send(column)}"
    end
  end

  private

    def set_allowed_attributes(attributes)
      attributes.each do |key, value|
        instance_variable_set("@#{key}", value) if ALLOWED_ATTRIBUTES.include?(key)
      end
    end

    def format_date_of_birth
      @date_of_birth = Date.strptime(@date_of_birth.gsub('-','/'), '%m/%d/%Y')
    end

end