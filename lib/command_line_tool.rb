class CommandLineTool

  def initialize(options)
    @record_collection = RecordCollection.new
    process_options(options)
  end

  def result
    return help_context if @help
    return no_sort_order if @output_type.nil?
    return no_record_file if @record_collection.all.empty?

    case @output_type
      when '1'
        format_list(@record_collection.order_by_gender)
      when '2'
        format_list(@record_collection.order_by_date_of_birth)
      when '3'
        format_list(@record_collection.order_by_last_name)
    end
  end

  private

    def format_list(list)
      (list.map &:to_s).join("\n")
    end

    def help_context
      <<-HELP.gsub(/^ {6}/, '')
        Usage:
          --output=n   Output type as specified by "n"
                        1 - sorted by gender (females before males)
                            then by last name ascending
                        2 - sorted by birth date, ascending
                        3 - sorted by last name, descending

          --pipe=file  Specify pipe delimited file with columns:
                        last_name, first_name, nil, gender,
                        favorite_color, date_of_birth

          --comma=file  Specify comma delimited file with columns:
                        last_name, first_name, gender, favorite_color, 
                        date_of_birth

          --space=file  Specify space delimited file with columns:
                        last_name, first_name, nil, gender, 
                        date_of_birth, favorite_color

          --help      This help dialog.
      HELP
    end

    def no_sort_order
      'You must specify a sort order'
    end

    def no_record_file
      'You must specify at least one record file'
    end

    def process_options(options)
      options.each do |option|
        case option
        when /^--output=/
          @output_type = option.split('=')[1]
        when /^--pipe=/
          process_list(option.split('=', 2).last, '|', PIPE_DELIMITED_COLUMNS)
        when /^--comma=/
          process_list(option.split('=', 2).last, ',', COMMA_DELIMITED_COLUMNS)
        when /^--space=/
          process_list(option.split('=', 2).last, ' ', SPACE_DELIMITED_COLUMNS)
        when '--help'
          @help = true
        end

      end
    end

    def process_list(file, delimiter, columns)
      @record_collection.add(ListParser.new(file, delimiter, columns).records_list)
    end

end