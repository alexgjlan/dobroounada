require 'rails_helper'

RSpec.describe "invites/index", type: :view do
  before(:each) do
    assign(:invites, [
      Invite.create!(
        :id_bet => 2,
        :id_user => 3
      ),
      Invite.create!(
        :id_bet => 2,
        :id_user => 3
      )
    ])
  end

  it "renders a list of invites" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
