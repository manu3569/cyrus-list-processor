class ListParser

  attr_reader :records_list

  def initialize(filename, delimiter, columns)
    @filename = filename
    @delimiter = delimiter
    @columns = columns
    @records_list = parse_file
  end

  private

    def parse_file
      File.read(@filename).split("\n").map do |raw_record|
        parse_record(raw_record)
      end
    end

    def parse_record(raw_record)
      column_values = raw_record.split(@delimiter).map &:strip
      attributes = @columns.each_with_index.inject({}) do |attrib, column|
        column_name = column.first
        column_index = column.last
        attrib[column_name] = column_values[column_index]
        attrib
      end
      Record.new(attributes)
    end
end