require 'test_helper'

class StoriesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @story = stories(:orange)
  end
  
  test "should redirect create when not logged in" do
    assert_no_difference "Story.count" do
      post stories_path, params: { story: {start_text: "起", consent_text: "承",
                                 terning_text: "転", finish_text: "結" } }
    end
    assert_redirected_to login_url
  end
  
  test "should redirect destroy when not logged in" do
    assert_no_difference "Story.count" do
      delete story_path(@story)
    end
    assert_redirected_to login_url
  end
end
