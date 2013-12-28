require './test/unit_helper'

class TestRecord < Minitest::Test
  include RecordTestData

  def setup
    @record = Record.new(attributes)
  end


  def test_for_record_instance
    assert_instance_of Record, @record
  end

  def test_for_last_name
    assert_equal last_name, @record.last_name
  end

  def test_for_first_name
    assert_equal first_name, @record.first_name
  end

  def test_for_gender
    assert_equal gender, @record.gender
  end

  def test_for_formatted_date_of_birth
    assert_equal formatted_date_of_birth, @record.date_of_birth
  end

  def test_for_favorite_color
    assert_equal favorite_color, @record.favorite_color
  end

  def test_for_rejection_of_disallowed_attribute
    phone_number = '555-321-9876'
    with_disallowed_attribute = attributes.merge({ phone_number: phone_number })
    record = Record.new(with_disallowed_attribute)
    assert_nil record.instance_variable_get('@phone_number')
  end

  def test_comparison_for_equal_records
    other_record = Record.new(attributes)
    assert_equal @record, other_record
  end

  def test_comparison_for_different_records
    other_record = Record.new(attributes.merge({ last_name: 'Other' }))
    refute_equal @record, other_record
  end

end