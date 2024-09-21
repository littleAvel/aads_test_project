module ApplicationHelper
  TIME_UNITS = [
    { seconds: 86400, name: "day" },
    { seconds: 3600, name: "hour" },
    { seconds: 60, name: "minute" },
    { seconds: 1, name: "second" }
  ].freeze

  def time_ago_in_words(timestamp)
    distance_in_time = Time.current - timestamp

    time_unit = TIME_UNITS.find { |unit| distance_in_time >= unit[:seconds] }
    return "just now" unless time_unit

    time = (distance_in_time / time_unit[:seconds]).to_i
    "#{time} #{time_unit[:name]}#{ 's' if time != 1} ago"
  end
end
