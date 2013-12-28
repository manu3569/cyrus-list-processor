require './test/unit_helper'

class TestListParser < Minitest::Test
  include RecordTestData
  # def setup
  #   @list_parser = ListParser.new(valid_attributes)
  # end

  def list_parser_for_pipe_delimited
    ListParser.new('test/data/pipe.txt', '|', PIPE_DELIMITED_COLUMNS)
  end

  def list_parser_for_comma_delimited
    ListParser.new('test/data/comma.txt', ',', COMMA_DELIMITED_COLUMNS)
  end

  def list_parser_for_space_delimited
    ListParser.new('test/data/space.txt', ' ', SPACE_DELIMITED_COLUMNS)
  end


  def test_for_initialization_with_comma_delimted_list
    assert_instance_of ListParser, list_parser_for_comma_delimited
  end

  # def test_for_records_list
  #   assert_equal records_list, list_parser_for_comma_delimited.records_list
  # end


end
