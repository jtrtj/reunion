require './lib/activity'

class Reunion
  attr_reader :location,
              :activities
  def initialize(location)
    @location   = location
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    @activities.map do |activity|
      activity.total_cost
    end.sum
  end
end
