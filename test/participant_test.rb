require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'
require './lib/participant'

class ActivityTest < Minitest::Test
  def test_participant_is_created_with_name_and_amount_paid
    jill_attributes = {:name => 'Jill', :amount_paid => 30.00}
    jill = Participant.new(jill_attributes)

    assert_equal 'Jill', jill.name
    assert_equal 30.00, jill.amount_paid
  end
end
