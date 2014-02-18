module Streak
  class File < StreakObject
    def self.all(box_key)
      res = Streak.request(:get, "/boxes/#{box_key}/files")
      convert_to_streak_object(res, File)
    end

    def self.get_link(file_key)
      res = Streak.request(:get, "/files/#{file_key}/link")
      convert_to_streak_object(res, File)
    end
  end
end
