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
end
