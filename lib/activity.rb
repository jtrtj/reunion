require './lib/participant'

class Activity
  attr_reader :name,
              :base_cost,
              :cost_per_participant,
              :participants
  def initialize(name, base_cost, cost_per_participant)
    @name = name
    @base_cost = base_cost
    @cost_per_participant = cost_per_participant
    @participants = Array.new
  end

  def add_participant(participant)
    @participants << participant
  end
end
