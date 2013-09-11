describe Streak::Stage do
  let!(:api) { Streak.mock_rest_client = double('RestClient') }
  let(:stage) { test_stage }

  describe ".all" do
    it "should call the api" do
      api.should_receive(:get).
        with(Streak.api_url("/pipelines/pipeline_key_1/stages"), nil, nil).
        and_return(test_response([stage]))

      Streak::Stage.all("pipeline_key_1")
    end
  end

  describe ".find" do
    it "should call the api" do
      api.should_receive(:get).
        with(Streak.api_url("/pipelines/pipeline_key_1/stages/stage_key_1"), nil, nil).
        and_return(test_response(stage))

      Streak::Stage.find("pipeline_key_1", "stage_key_1")
    end
  end

  describe ".create" do
    it "should call the api" do
      api.should_receive(:put).
        with(Streak.api_url("/pipelines/pipeline_key_1/stages"), nil, "name=New%20Stage").
        and_return(test_response(stage))

      Streak::Stage.create("pipeline_key_1", :name => "New Stage")
    end
  end
end
