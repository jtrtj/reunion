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

  def total_cost
    base_cost + (cost_per_participant * participants.length)
  end

  def participant_fair_share
    total_cost / participants.length
  end
end
