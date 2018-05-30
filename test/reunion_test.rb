require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/reunion'

class ReunionTest < Minitest::Test
  def test_reunion_has_a_location_and_starts_with_no_activities
    reunion = Reunion.new('Ft. Collins, CO')

    assert_equal 'Ft. Collins, CO', reunion.location
    assert_equal [], reunion.activities
  end

  def test_activities_can_be_added_to_reunion
    reunion = Reunion.new('Ft. Collins, CO')
    bowling = Activity.new('Bowling', 90.00, 21.00)
    brewery_tour = Activity.new('Brewery Tour', 0.00, 17.50)

    reunion.add_activity(bowling)
    reunion.add_activity(brewery_tour)

    assert_equal 2, reunion.activities.length
    assert_equal 'Bowling', reunion.activities.first.name
    assert_equal 'Brewery Tour', reunion.activities.last.name
  end

  def test_reunion_can_calculate_its_total_cost
    reunion = Reunion.new('Ft. Collins, CO')
    bowling = Activity.new('Bowling', 90.00, 21.00)
    brewery_tour = Activity.new('Brewery Tour', 0.00, 17.50)

    reunion.add_activity(bowling)
    reunion.add_activity(brewery_tour)

    jill_attributes = { :name => 'Jill', :amount_paid => 100.50 }
    jill = Participant.new(jill_attributes)
    chris_attributes = { :name => 'Chris', :amount_paid => 77.50 }
    chris = Participant.new(chris_attributes)
    wesker_attributes = { :name => 'Wesker', :amount_paid => 97.00 }
    wesker = Participant.new(wesker_attributes)

    bowling.add_participant(jill)
    bowling.add_participant(chris)
    brewery_tour.add_participant(wesker)
    brewery_tour.add_participant(jill)
    brewery_tour.add_participant(chris)

    assert_equal 184.50, reunion.total_cost
  end
end
