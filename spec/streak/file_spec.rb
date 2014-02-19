describe Streak::File do
  let!(:api) { Streak.mock_rest_client = double('RestClient') }
  let(:box) { test_box }

  describe ".all" do
    it "should call the api" do
      api.should_receive(:get).
        with(Streak.api_url("/boxes/box_key_1/files"), nil, nil).
        and_return(test_response(box))

      Streak::File.all("box_key_1")
    end
  end

  describe ".get_link" do
    it "should call the api" do
      api.should_receive(:get).
        with(Streak.api_url("/files/box_key_1/link"), nil, nil).
        and_return(test_response(box))

      Streak::File.get_link("box_key_1")
    end
  end

end
