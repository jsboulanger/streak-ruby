module Streak
  class Thread < StreakObject
    def self.all(box_key)
      path = "/boxes/#{box_key}/threads"
      res = Streak.request(:get, path)
      convert_to_streak_object(res, Thread)
    end

    def self.find(key)
      res = Streak.request(:get, "/threads/#{key}")
      convert_to_streak_object(res, Thread)
    end
  end
end
