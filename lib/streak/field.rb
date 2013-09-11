module Streak
  class Field < StreakObject
    def self.all(pipeline_key)
      res = Streak.request(:get, "/pipelines/#{pipeline_key}/fields")
      convert_to_streak_object(res, Field)
    end

    def self.find(pipeline_key, field_key)
      res = Streak.request(:get, "/pipelines/#{pipeline_key}/fields/#{field_key}")
      convert_to_streak_object(res, Field)
    end

    def self.create(pipeline_key, params)
      res = Streak.request(:put, "/pipelines/#{pipeline_key}/fields", params)
      convert_to_streak_object(res, Field)
    end

    def self.update(pipeline_key, field_key, params={})
      res = Streak.request(:post, "/pipelines/#{pipeline_key}/fields/#{field_key}", MultiJson.dump(params))
      convert_to_streak_object(res, Field)
    end
  end
end

