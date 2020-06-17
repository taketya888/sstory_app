require 'test_helper'

class UsersLikeTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @another = users(:mayoi)
    @story = stories(:orange)
  end
  
  test "should create like when login same_user" do
    log_in_as(@user)
    get story_path(@story)
    assert_template "stories/show"
    assert_select "span.like-btn",count:0
    assert_select "span.like-btn-unlike",count:0
  end
  
  test "should create like and increse likes_count when post like create" do
    log_in_as(@another)
    get story_path(@story)
    assert_template "stories/show"
    assert_select "span.like-btn", count:1
    assert_difference "Like.count", 1 do
    post "/likes/#{@story.id}/create", params:{ user_id: @another.id,
                                               story_id: @story.id } 
    end
    #assert_select "span.like-btn-unlike",count:1
  end
end

  