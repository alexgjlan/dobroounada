require 'rails_helper'

RSpec.describe "invites/show", type: :view do
  before(:each) do
    @invite = assign(:invite, Invite.create!(
      :id_bet => 2,
      :id_user => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
