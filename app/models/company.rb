class Company < ActiveRecord::Base
  has_many :freebies
  has_many :devs, through: :freebies

  def give_freebie(dev, item_name, value)
    Freebie.create(dev: dev, company: self, value: value, item_name: item_name)
  end

  def self.oldest_company
    all.min_by(&:founding_year)
  end
end
