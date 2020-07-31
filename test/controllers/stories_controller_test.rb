require "test_helper"

class StoriesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @story = stories(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference "Story.count" do
      post stories_path, params: { story: { start_text: "起", consent_text: "承",
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

  test "should redirect show when made story" do
    log_in_as(@user)
    get new_story_path
    assert_template "stories/new"
    assert_difference "Story.count" do
      post stories_path, params: { story: { title: "example",
                                           start_text: "起",
                                           consent_text: "承",
                                           terning_text: "転",
                                           finish_text: "結" }}
    end
  end

  test "should redirect users show when destroy story" do
    log_in_as(@user)
    get story_path(@story)
    assert_template "stories/show"
    delete story_path(@story)
    assert_redirected_to user_path(@user)
  end

  test "should show title + 4 page + fin when user get stories/show" do
    log_in_as(@user)
    get story_path(@story)
    assert_template "stories/show"
    assert_select "span.fa-heart", count: 0
  end
end
