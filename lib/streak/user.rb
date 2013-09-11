module Streak
  class User < StreakObject
    def self.me
      res = Streak.request(:get, "/users/me")
      convert_to_streak_object(res, User)
    end

    def self.find(key)
      res = Streak.request(:get, "/users/#{key}")
      convert_to_streak_object(res, User)
    end
  end
end

