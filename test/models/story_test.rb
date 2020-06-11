require 'test_helper'

class StoryTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:michael)
    @story = @user.stories.build(title: "asadamao",start_text: "起", consent_text: "承",
                                 terning_text: "転", finish_text: "結")
  end
  
  test "should be valid" do
    assert @story.valid?
  end
  
  test "user_id should be present" do
    @story.user_id = nil
    assert_not @story.valid?
  end
  
  test "start_text should be present" do
    @story.start_text = nil
    assert_not @story.valid?
  end
  
  test "consent_text should be present" do
    @story.consent_text = nil
    assert_not @story.valid?
  end
  
  test "terning_text should be present" do
    @story.terning_text = nil
    assert_not @story.valid?
  end
  
  test "finish_text should be present" do
    @story.finish_text = nil
    assert_not @story.valid?
  end
  
  test "start_text should be at most 140 characters" do
    @story.start_text = "a" * 141
    assert_not @story.valid?
  end
  
  test "consent_text should be at most 140 characters" do
    @story.consent_text = "a" * 141
    assert_not @story.valid?
  end
  
  test "terning_text should be at most 140 characters" do
    @story.terning_text = "a" * 141
    assert_not @story.valid?
  end
  
  test "finish_text should be at most 140 characters" do
    @story.finish_text = "a" * 141
    assert_not @story.valid?
  end
  
  test "title should be present" do
    @story.title = nil
    assert_not @story.valid?
  end
  
  test "title should be at most 50 characters" do
    @story.title = "a" * 51
    assert_not @story.valid?
  end
end
