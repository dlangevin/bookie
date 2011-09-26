require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "should define a relationship with started challenges" do
    @challenge = challenges(:one)
    @user = users(:one)
    @challenge.update_attribute(:started_by, @user.id)
    assert @user.started_challenges.include?(@challenge)
  end
end
