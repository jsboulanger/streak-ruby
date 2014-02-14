describe Streak::Search do
  let!(:api) { Streak.mock_rest_client = double('RestClient') }
  let(:box) { test_box }

  describe ".search" do
    it "should call the api" do
      api.should_receive(:get).
        with(Streak.api_url("/search?query=box_key_1"), nil, nil).
        and_return(test_response(box))

      Streak::Search.query("box_key_1")
    end
  end

end
