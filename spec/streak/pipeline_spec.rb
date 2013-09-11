describe Streak::Pipeline do
  let!(:api) { Streak.mock_rest_client = double('RestClient') }
  let(:pipeline) { test_pipeline }

  describe ".all" do
    it "should call the api" do
      api.should_receive(:get).
        with(Streak.api_url("/pipelines"), nil, nil).
        and_return(test_response([pipeline]))

      Streak::Pipeline.all
    end
  end

  describe ".find" do
    it "should call the api" do
      api.should_receive(:get).
        with(Streak.api_url("/pipelines/key_1"), nil, nil).
        and_return(test_response(pipeline))

      Streak::Pipeline.find("key_1")
    end
  end

  describe ".create" do
    it "should call the api" do
      api.should_receive(:put).
        with(Streak.api_url("/pipelines"), nil, "name=Sales%20Pipeline").
        and_return(test_response(pipeline))

      Streak::Pipeline.create(:name => "Sales Pipeline")
    end
  end

  describe ".update" do
    it "should call the api" do
      api.should_receive(:post).
        with(Streak.api_url("/pipelines/key_1"), nil, "{\"name\":\"Inbound Sales\"}").
        and_return(test_response(pipeline))

      Streak::Pipeline.update("key_1", :name => "Inbound Sales")
    end
  end
end
