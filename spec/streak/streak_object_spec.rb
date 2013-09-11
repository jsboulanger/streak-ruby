describe Streak::StreakObject do
  describe "#initialize" do
    describe "when creating a new object" do
      # TODO
    end

    describe "when loading an object from the API" do
      let(:values) { {
          "key" => "5001",
          "creatorKey" => "1234"
        } }
      subject { Streak::StreakObject.new(values) }

      its(:key) { should == "5001" }
      its(:creator_key) { should == "1234" }

      context "with a relation type that is defined" do
        before do
          Streak::StreakObject.stub(:relations).and_return({ :owner => Streak::User })
          values["owner"] = { "displayName" => "George" }
        end

        its(:owner) { should be_instance_of(Streak::User) }
      end

      context "with a relation type that is undefined" do
        before do
          values["owner"] = { "displayName" => "George" }
        end

        its(:owner) { should be_instance_of(Streak::StreakObject) }
      end

      context "with a relation that is an array" do
        before do
          values["fields"] = [{ "name" => "Source" }, { "key" => "1002" }]
        end

        its(:fields) { should be_instance_of(Array) }
      end
    end
  end

  describe ".convert_to_streak_object" do
    context "with an Array" do
      let(:response) { [{ "key" => "5001" }, { "key" => "5002" }] }
      subject { Streak::StreakObject.convert_to_streak_object(response) }
      it { should be_instance_of(Array) }
    end

    context "with a Hash" do
      let(:response) { { "key" => "5001" } }

      context "when given the target type" do
        subject { Streak::StreakObject.convert_to_streak_object(response, Streak::Pipeline) }
        it { should be_instance_of(Streak::Pipeline) }
      end

      context "when given the parent's type and relation" do
        subject { Streak::StreakObject.convert_to_streak_object(response, Streak::Pipeline, :fields) }
        it { should be_instance_of(Streak::Field) }
      end

      context "when target type is not given" do
        subject { Streak::StreakObject.convert_to_streak_object(response) }
        it { should be_instance_of(Streak::StreakObject) }
      end
    end

    context "with another type" do
      subject { Streak::StreakObject.convert_to_streak_object("value") }
      it { should == "value" }
    end
  end
end
