class Participant
  def initialize(attributes)
    @attributes = attributes
  end

  def name
    @attributes[:name]
  end

  def amount_paid
    @attributes[:amount_paid]
  end
end
