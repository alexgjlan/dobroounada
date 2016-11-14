require 'rails_helper'

RSpec.describe "invites/edit", type: :view do
  before(:each) do
    @invite = assign(:invite, Invite.create!(
      :id_bet => 1,
      :id_user => 1
    ))
  end

  it "renders the edit invite form" do
    render

    assert_select "form[action=?][method=?]", invite_path(@invite), "post" do

      assert_select "input#invite_id_bet[name=?]", "invite[id_bet]"

      assert_select "input#invite_id_user[name=?]", "invite[id_user]"
    end
  end
end
