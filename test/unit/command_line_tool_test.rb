require './test/unit_helper'

class TestCommandLineTool < Minitest::Test
  include RecordTestData

  def test_help_output
    command_line_tool = CommandLineTool.new(["--help"])
    assert_match /Usage:/, command_line_tool.to_s
  end

  def test_missing_list_message    
    command_line_tool = CommandLineTool.new(["--output=1"])
    assert_match /You must specify at least one record file/, command_line_tool.to_s
  end

  def test_processing_lists_with_result_ordered_by_gender_and_last_name
    command_line_tool = CommandLineTool.new(record_files + ["--output=1"])
    assert_match gender_order_regex, command_line_tool.to_s
  end

  def test_processing_lists_with_result_ordered_by_date_of_birth
    command_line_tool = CommandLineTool.new(record_files + ["--output=2"])
    assert_match date_of_birth_order_regex, command_line_tool.to_s
  end

  def test_processing_lists_with_result_ordered_by_last_name_descending
    command_line_tool = CommandLineTool.new(record_files + ["--output=3"])
    assert_match last_name_order_regex, command_line_tool.to_s
  end

end