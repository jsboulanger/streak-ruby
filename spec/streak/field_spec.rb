describe Streak::Field do
  let!(:api) { Streak.mock_rest_client = double('RestClient') }
  let(:field) { test_field }

  describe ".all" do
    it "should call the api" do
      api.should_receive(:get).
        with(Streak.api_url("/pipelines/pipeline_key_1/fields"), nil, nil).
        and_return(test_response([field]))

      Streak::Field.all("pipeline_key_1")
    end
  end

  describe ".find" do
    it "should call the api" do
      api.should_receive(:get).
        with(Streak.api_url("/pipelines/pipeline_key_1/fields/field_key_1"), nil, nil).
        and_return(test_response(field))

      Streak::Field.find("pipeline_key_1", "field_key_1")
    end
  end

  describe ".create" do
    it "should call the api" do
      api.should_receive(:put).
        with(Streak.api_url("/pipelines/pipeline_key_1/fields"), nil, "name=New%20Field").
        and_return(test_response(field))

      Streak::Field.create("pipeline_key_1", :name => "New Field")
    end
  end

  describe ".update" do
    it "should call the api" do
      api.should_receive(:post).
        with(Streak.api_url("/pipelines/pipeline_key_1/fields/field_key_1"), nil, "{\"name\":\"New Name\"}").
        and_return(test_response(field))

      Streak::Field.update("pipeline_key_1", "field_key_1", :name => "New Name")
    end
  end
end
