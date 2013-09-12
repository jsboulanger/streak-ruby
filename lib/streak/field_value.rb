module Streak
  class FieldValue < StreakObject
    def self.attributes
      [:key, :value]
    end

    def self.all(box_key)
      res = Streak.request(:get, "/boxes/#{box_key}/fields")
      convert_to_streak_object(res, FieldValue)
    end

    def self.find(box_key, field_key)
      res = Streak.request(:get, "/boxes/#{box_key}/fields/#{field_key}")
      convert_to_streak_object(res, FieldValue)
    end

    def self.update(box_key, field_key, params={})
      res = Streak.request(:post, "/boxes/#{box_key}/fields/#{field_key}", MultiJson.dump(params))
      convert_to_streak_object(res, FieldValue)
    end
  end
end
