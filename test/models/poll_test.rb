require 'test_helper'

class PollTest < ActiveSupport::TestCase
   def setup
    @user = users(:rails)
    @poll = @user.polls.build(topic: "Can you see my first poll?")
  end

  test "should be valid" do
    assert @poll.valid?
  end

  test "user id should be present" do
    @poll.user_id = nil
    assert_not @poll.valid?
  end

  test "topic should be present" do
    @poll.topic = "   "
    assert_not @poll.valid?
  end

  test "order should be most recent first" do
    assert_equal polls(:most_recent), Poll.first
  end
end
