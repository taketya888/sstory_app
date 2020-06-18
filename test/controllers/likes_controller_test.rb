require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
    def setup
        @user = users(:michael)
        @another = users(:mayoi)
        @story = stories(:orange)
        @another_story = stories(:peach)
    end
    
    test "should create like when login same_user" do
        log_in_as(@user)
        get story_path(@story)
        assert_template "stories/show"
        assert_select "span.like-btn",count:0
        assert_select "span.like-btn-unlike",count:0
        #assert_no_difference "likes.count", 1 do
            #post like_path(@story), params: { like: { user_id: @user.id, story_id: @story.id } }
        #end
    end
  
  test "should create like when login differ user" do
    log_in_as(@another)
    get story_path(@story)
    assert_template "stories/show"
    #assert_difference "likes.count", 1 do
        #post like_path(@story), params: { like: { user_id: @another.id } }
    #end
    
  end
end
