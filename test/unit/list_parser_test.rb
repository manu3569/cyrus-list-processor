require './test/unit_helper'

class TestListParser < Minitest::Test
  include RecordTestData


  def list_parser_for_pipe_delimited
    ListParser.new('test/data/pipe.txt', '|', pipe_delimited_columns)
  end

  def list_parser_for_comma_delimited
    ListParser.new('test/data/comma.txt', ',', comma_delimited_columns)
  end

  def list_parser_for_space_delimited
    ListParser.new('test/data/space.txt', ' ', space_delimited_columns)
  end



  def test_for_initialization_with_pipe_delimted_list
    assert_instance_of ListParser, list_parser_for_pipe_delimited
  end

  def test_for_pipe_delimted_records_list
    assert_equal pipe_delimited_records_list, list_parser_for_pipe_delimited.records_list
  end

  def test_for_initialization_with_comma_delimted_list
    assert_instance_of ListParser, list_parser_for_comma_delimited
  end

  def test_for_comma_delimited_records_list
    assert_equal comma_delimited_records_list, list_parser_for_comma_delimited.records_list
  end

  def test_for_initialization_with_space_delimted_list
    assert_instance_of ListParser, list_parser_for_space_delimited
  end

  def test_for_space_delimited_records_list
    assert_equal space_delimited_records_list, list_parser_for_space_delimited.records_list
  end

end
