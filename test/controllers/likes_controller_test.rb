require "test_helper"

class LikesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @another = users(:mayoi)
    @story = stories(:orange)
    @another_story = stories(:peach)
  end

  test "should create like when login differ user" do
    log_in_as(@another)
    get story_path(@story)
    assert_template "stories/show"
    post like_path(@story),xhr: true, params: { like: { user_id: @another.id, story_id: @story.id } }
    assert_response :success
    end
end
