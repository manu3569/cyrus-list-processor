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

  private

    def set_allowed_attributes(attributes)
      attributes.each do |key, value|
        instance_variable_set("@#{key}", value) if ALLOWED_ATTRIBUTES.include?(key)
      end
    end

    def format_date_of_birth
      @date_of_birth &&= Date.parse(@date_of_birth).strftime("%m/%d/%Y")
    end

end