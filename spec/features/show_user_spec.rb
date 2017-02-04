require 'rails_helper'

describe "View an individual user" do 
  it "shows the user's detail" do
    user = User.create!(user_attributes)

    sign_in(user)

    visit user_url(user)

    expect(page).to have_text(user.name)
    expect(page).to have_text(user.email)
  end
end
