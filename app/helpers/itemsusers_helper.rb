module ItemsusersHelper

# args is a hash containing:
# {relation: itemsuserrelation,
#   time: now}

  def update_relation_stats(args)
    relation = args[:relation]

    last_purchase = relation.recent_purchase
    prev_freq = relation.purchase_freq
    time_lapse = now - last_purchase
    prev_purchase_total = relation.total_purchases

    # updates
    relation.total_purchases +=1
    relation.purchase_freq = ((prev_freq*prev_purchase_total)+time_lapse)/relation.total_purchases
    relation.recent_purchase = args[:time]

    relation.save

  end

end

