require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  def test_activity_starts_with_name_base_cost_and_cost_per_participant
    bowling = Activity.new('Bowling', 90.00, 21.00)

    assert_instance_of Activity, bowling
    assert_equal 'Bowling', bowling.name
    assert_equal 90.00, bowling.base_cost
    assert_equal 21.00, bowling.cost_per_participant
  end

  def test_activity_has_participants
    bowling = Activity.new('Bowling', 90.00, 21.00)
    jill_attributes = {:name => 'Jill', :amount_paid => 30.00}
    jill = Participant.new(jill_attributes)
    chris_attributes = {:name => 'Chris', :amount_paid => 55.00}
    chris = Participant.new(chris_attributes)

    bowling.add_participant(jill)
    bowling.add_participant(chris)

    assert_equal 2, bowling.participants.length
    assert_equal 'Chris', bowling.participants.last.name
  end
end
