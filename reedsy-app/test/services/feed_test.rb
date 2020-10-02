require 'test_helper'

class FeedTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
    feed_new = Feed.new(@user)
    feed_new.retrieve
  end
end
