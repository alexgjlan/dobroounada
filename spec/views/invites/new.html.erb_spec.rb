require 'rails_helper'

RSpec.describe "invites/new", type: :view do
  before(:each) do
    assign(:invite, Invite.new(
      :id_bet => 1,
      :id_user => 1
    ))
  end

  it "renders new invite form" do
    render

    assert_select "form[action=?][method=?]", invites_path, "post" do

      assert_select "input#invite_id_bet[name=?]", "invite[id_bet]"

      assert_select "input#invite_id_user[name=?]", "invite[id_user]"
    end
  end
end
