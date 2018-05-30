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
    @participants = {}
  end

  def add_participant(participant)
    @participants[participant.name] = participant
  end

  def total_cost
    base_cost + (cost_per_participant * participants.length)
  end

  def participant_fair_share
    total_cost / participants.length
  end

  def participant_owed(participant_name)
    participant_fair_share - participants[participant_name].amount_paid
  end
end
