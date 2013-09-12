describe Streak::FieldValue do
  let!(:api) { Streak.mock_rest_client = double('RestClient') }
  let(:field_value) { test_field_value }

  describe ".new" do
    context "when the response has no value" do
      subject { Streak::FieldValue.new(:key => "1002") }
      its(:value) { should be_nil }
    end
  end

  describe ".all" do
    it "should call the api" do
      api.should_receive(:get).
        with(Streak.api_url("/boxes/box_key_1/fields"), nil, nil).
        and_return(test_response([field_value]))

      Streak::FieldValue.all("box_key_1")
    end
  end

  describe ".find" do
    it "should call the api" do
      api.should_receive(:get).
        with(Streak.api_url("/boxes/box_key_1/fields/field_key_1"), nil, nil).
        and_return(test_response(field_value))

      Streak::FieldValue.find("box_key_1", "field_key_1")
    end
  end

  describe ".update" do
    it "should call the api" do
      api.should_receive(:post).
        with(Streak.api_url("/boxes/box_key_1/fields/field_key_1"), nil, "{\"value\":\"New value\"}").
        and_return(test_response(field_value))

      Streak::FieldValue.update("box_key_1", "field_key_1", :value => "New value")
    end
  end
end
