describe Streak::Thread do
  let!(:api) { Streak.mock_rest_client = double('RestClient') }
  let(:thread) { test_thread }

  describe ".all" do
    it "should call the api" do
      api.should_receive(:get).
        with(Streak.api_url("/boxes/box_key_1/threads"), nil, nil).
        and_return(test_response([thread]))

      Streak::Thread.all("box_key_1")
    end
  end

  describe ".find" do
    it "should call the api" do
      api.should_receive(:get).
        with(Streak.api_url("/threads/thread_key_1"), nil, nil).
        and_return(test_response(thread))

      Streak::Thread.find("thread_key_1")
    end
  end
end
