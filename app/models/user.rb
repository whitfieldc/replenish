class User < ActiveRecord::Base
  has_many :itemsusers
  has_many :items, through: :itemsusers


  # private

  def get_list
    all_relations = self.itemsusers
    time = Time.now
    predictions = all_relations.select do |relation|
      if relation.purchase_freq
        (relation.purchase_freq * 86400) < (time - relation.recent_purchase)
      end
    end
    list = predictions.map do |relation|
      Item.where(id: relation.item_id)
    end
    return list.flatten
  end

end
