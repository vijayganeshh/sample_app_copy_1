require 'test_helper'

class PollsControllerTest < ActionController::TestCase
  def setup
    @poll = polls(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Poll.count' do
      post :create, poll: { topic: "Lorem ipsum" }
    end
    assert_redirected_to login_url
  end
end
