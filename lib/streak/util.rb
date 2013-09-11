module Streak
  module Util
    # creatorKey => :creator_key
    def self.symbolize_attribute(attr)
      word = attr.to_s.dup
      word.gsub!(/([A-Z\d]+)([A-Z][a-z])/,'\1_\2')
      word.gsub!(/([a-z\d])([A-Z])/,'\1_\2')
      word.tr!("-", "_")
      word.downcase!
      word.to_sym
    end
  end
end

