module Streak
  class Pipeline < StreakObject
    def self.relations
      { :fields => Streak::Field, :owner => Streak::User, :stages => Streak::Stage }
    end

    def self.all
      res = Streak.request(:get, "/pipelines")
      convert_to_streak_object(res, Pipeline)
    end

    def self.find(key)
      res = Streak.request(:get, "/pipelines/#{key}")
      convert_to_streak_object(res, Pipeline)
    end

    def self.create(params)
      res = Streak.request(:put, "/pipelines", params)
      convert_to_streak_object(res, Pipeline)
    end

    def self.update(key, params)
      res = Streak.request(:post, "/pipelines/#{key}", MultiJson.dump(params))
      convert_to_streak_object(res, Pipeline)
    end
  end
end

