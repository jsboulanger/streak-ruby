describe Streak::Box do
  let!(:api) { Streak.mock_rest_client = double('RestClient') }
  let(:box) { test_box }

  describe ".all" do
    it "should call the api" do
      api.should_receive(:get).
        with(Streak.api_url("/boxes"), nil, nil).
        and_return(test_response([box]))

      Streak::Box.all
    end

    context "for a pipeline" do
      it "should call the api" do
        api.should_receive(:get).
          with(Streak.api_url("/pipelines/pipeline_key_1/boxes"), nil, nil).
          and_return(test_response([box]))

        Streak::Box.all("pipeline_key_1")
      end
    end
  end

  describe ".find" do
    it "should call the api" do
      api.should_receive(:get).
        with(Streak.api_url("/boxes/box_key_1"), nil, nil).
        and_return(test_response(box))

      Streak::Box.find("box_key_1")
    end
  end

  describe ".create" do
    it "should call the api" do
      api.should_receive(:put).
        with(Streak.api_url("/pipelines/pipeline_key_1/boxes"), nil, "name=Great%20Vendor").
        and_return(test_response(box))

      Streak::Box.create("pipeline_key_1", :name => "Great Vendor")
    end
  end

  describe ".update" do
    it "should call the api" do
      api.should_receive(:post).
        with(Streak.api_url("/boxes/box_key_1"), nil, "{\"name\":\"Greatest Vendor\"}").
        and_return(test_response(box))

      Streak::Box.update("box_key_1", :name => "Greatest Vendor")
    end
  end
end
