require 'spec_helper'

describe "FollowUnfollow" do
  it "should change following count when clicking 'Follow' button" do
    user = Factory(:user)
    other_user = Factory(:user, :email => Factory.next(:email))
    integration_sign_in(user)

    visit user_path(other_user)
    lambda do
      visit user_path(other_user)
      click_button
    end.should change(user.following, :count).by(1)

    lambda do
      visit user_path(other_user)
      click_button
    end.should change(user.following, :count).by(-1)
  end
end

