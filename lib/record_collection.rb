class RecordCollection

  attr_reader :all

  def initialize
    @all = []
  end

  def add(record_list)
    @all += record_list
  end

  def order_by_last_name
    self.all.sort_by { |r| r.last_name }
  end

  def order_by_date_of_birth
    self.all.sort_by { |r| r.sortable_date_of_birth }.reverse
  end

  def order_by_gender
    self.all.sort_by { |r| r.gender[0] }
  end

end