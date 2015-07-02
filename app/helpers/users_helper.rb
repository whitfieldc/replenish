module UsersHelper

# args is a hash containing:
# {user: current_user,
#   time: now}

  def update_user_stats(args)
    user = args[:user]

    last_trip = user.recent_purchase
    prev_freq = user.shopping_freq
    time_lapse = now - last_trip
    prev_trip_total = user.total_trips

    # updates
    user.total_trips +=1
    user.shopping_freq = ((prev_freq*prev_trip_total)+time_lapse)/user.total_trips
    user.recent_trip = args[:time]

    user.save

  end

end

