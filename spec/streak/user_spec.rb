describe Streak::User do
  let!(:api) { Streak.mock_rest_client = double('RestClient') }
  let(:user) { test_user }

  describe ".me" do
    it "should call the api" do
      api.should_receive(:get).
        with(Streak.api_url("/users/me"), nil, nil).
        and_return(test_response([user]))

      Streak::User.me
    end
  end

  describe ".find" do
    it "should call the api" do
      api.should_receive(:get).
        with(Streak.api_url("/users/key_1"), nil, nil).
        and_return(test_response(user))

      Streak::User.find("key_1")
    end
  end
end
