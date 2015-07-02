require 'Date'
class Itemsuser < ActiveRecord::Base
  belongs_to :user
  belongs_to :item

  def self.find_or_create(args)
    target_relation = self.where(user_id: args[:user_id], item_id: args[:id]).first
    target_relation ||= self.create(item_id: args[:id], user_id: args[:user_id])
  end

  def refresh
    if self.total_purchases == 0
      self.recent_purchase = Time.now
      self.total_purchases += 1
    else
      current_time = Time.now
      old = Date.parse(self.recent_purchase.to_s).mjd
      now = Date.parse(current_time.to_s).mjd
      new_interval = (now - old).to_f
      total_intervals = (self.purchase_freq || 0) * self.total_purchases
      self.total_purchases += 1
      total_intervals += new_interval
      new_average = total_intervals.fdiv(self.total_purchases)
      self.recent_purchase = current_time
      self.purchase_freq = new_average
    end
    self.save
  end

end
