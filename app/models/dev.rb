class Dev < ActiveRecord::Base
  has_many :freebies

  def received_one?(item_name)
    freebies.any? { |e| e.item_name == item_name }
    # freebies.select { |e| e.item_name == item_name }.!empty?
  end

  # accepts a Dev instance and a Freebie instance, changes the freebie's dev to be the given dev;
  def give_away(dev, freebie)
    # only make the change if the freebie belongs to the dev who's giving it away
    freebie.update(dev: dev) unless freebie.dev != self
  end
end
