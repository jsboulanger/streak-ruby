module Streak
  class StreakObject

    def self.convert_to_streak_object(resp, type = nil, relation = nil)
      case resp
      when Array
        resp.map { |r| convert_to_streak_object(r, type, relation) }
      when Hash
        object_class = (relation.nil? ? type : type.relations[relation]) || StreakObject
        object_class.construct_from(resp)
      else
        resp
      end
    end

    def self.relations
      {}
    end

    def self.construct_from(values)
      object = self.new(values)
    end

    def initialize(values)
      @values = {}
      values.each do |k, v|
        attr = Util.symbolize_attribute(k)
        @values[attr] = StreakObject.convert_to_streak_object(v, self.class, attr)
      end
    end

    def method_missing(name, *args)
      if @values.has_key?(name)
        @values[name]
      else
        super
      end
    end
  end
end

