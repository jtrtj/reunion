require './lib/activity'

class Reunion
  attr_reader :location,
              :activities
  def initialize(location)
    @location     = location
    @activities   = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    @activities.map do |activity|
      activity.total_cost
    end.sum
  end

  def owes_or_owed(participant_name)
    owed = @activities.map do |activity|
      if activity.participants.has_key?(participant_name)
        activity.participant_fair_share
      end
    end.compact.sum
    paid = get_a_participant(participant_name)
    binding.pry
    owed - paid
  end

  def get_a_participant(participant_name)
    @activities.participants.has_key?(participant_name)
  end
end
