class Dev < ActiveRecord::Base
  has_many :freebies
  has_many :companies, through: :freebies

  def received_one?(item_name)
    # self.freebies[0].item_name == item_name
    freebies = self.freebies
    freebies.any? do |item|
      item.item_name == item_name
    end
  end

  def give_away(dev, freebie)
    # freebie belongs to other_dev
    Freebie.update(dev_id: dev.id)
  end
end
