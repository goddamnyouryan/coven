Coven.Helpers =
  dashify: (string) ->
    string = string.replace(/(.)([A-Z])/,'$1-$2')
    string.toLowerCase()

  timeAgo: (date) ->
    date = new Date(date)  if typeof date isnt "object"
    seconds = Math.floor((new Date() - date) / 1000)
    intervalType = undefined
    interval = Math.floor(seconds / 31536000)
    if interval >= 1
      intervalType = "year"
    else
      interval = Math.floor(seconds / 2592000)
      if interval >= 1
        intervalType = "month"
      else
        interval = Math.floor(seconds / 86400)
        if interval >= 1
          intervalType = "day"
        else
          interval = Math.floor(seconds / 3600)
          if interval >= 1
            intervalType = "hour"
          else
            interval = Math.floor(seconds / 60)
            if interval >= 1
              intervalType = "minute"
            else
              interval = seconds
              intervalType = "second"
    intervalType += "s"  if interval > 1 or interval is 0
    interval + " " + intervalType
