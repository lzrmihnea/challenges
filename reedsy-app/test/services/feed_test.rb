require 'test_helper'

class FeedTest < ActiveSupport::TestCase
  test "Question 2: book feed which refreshes at each call:" do
    assert true
    @user = User.new
    @user.id = Faker::Number.within(range: 1..1000)
    @user.name = Faker::FunnyName.name
    feed_new = Feed.new(@user)
    retrieved_feed = feed_new.retrieve
    puts 'Retrieved feed of books: '
    puts retrieved_feed.inspect
    assert_equal(7, retrieved_feed.length)
  end
end
