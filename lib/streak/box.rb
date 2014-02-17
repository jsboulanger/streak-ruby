module Streak
  class Box < StreakObject
    def self.all(pipeline_key=nil, params={})
      path = pipeline_key ? "/pipelines/#{pipeline_key}/boxes" : "/boxes"
      res = Streak.request(:get, path, params)
      convert_to_streak_object(res, Box)
    end

    def self.find(key)
      res = Streak.request(:get, "/boxes/#{key}")
      convert_to_streak_object(res, Box)
    end

    def self.create(pipeline_key, params={})
      res = Streak.request(:put, "/pipelines/#{pipeline_key}/boxes", params)
      convert_to_streak_object(res, Box)
    end

    def self.update(key, params)
      res = Streak.request(:post, "/boxes/#{key}", MultiJson.dump(params))
      convert_to_streak_object(res, Box)
    end
  end
end
