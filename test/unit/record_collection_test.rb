require './test/unit_helper'

class TestRecordCollection < Minitest::Test
  include RecordTestData

  def setup
    @record_collection = RecordCollection.new
    @record_collection.add(pipe_delimited_records_list)
    @record_collection.add(comma_delimited_records_list)
    @record_collection.add(space_delimited_records_list)
  end

  def test_initialization_of_record_collection
    assert_instance_of RecordCollection, @record_collection
  end

  def test_for_all_method_to_return_records_array
    assert_instance_of Array, @record_collection.all
  end

  def test_adding_a_record_to_the_collection
    record_list = [Record.new(attributes)]
    @record_collection.add(record_list)
    assert_equal 10, @record_collection.all.count
  end

  def test_records_order_by_last_name
    assert_equal ordered_by_last_name, (@record_collection.order_by_last_name.map &:last_name)
  end

  def test_records_order_by_date_of_birth
    assert_equal ordered_by_date_of_birth, (@record_collection.order_by_date_of_birth.map &:last_name)
  end

  def test_records_order_by_gender
    assert_equal ordered_by_gender, (@record_collection.order_by_gender.map &:last_name)
  end

end
