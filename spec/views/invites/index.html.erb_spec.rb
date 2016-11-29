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
        :id_user => 4
      )
    ])
    assign(:aposta, Bet.create!(
        :id => 2,
        :name => "Name",
        :description => "Description",
        :usuario_id => 1,
        :url_photo => "Url Photo",
        :category => "Category",
        :room_status => 0,
        :room_type => 0,
        :stake => 5,
        :final_answer => "Final Answer",
        :answer_type => "Answer Type"
      ))
    assign(:dono, Usuario.create!(
        :id => 1,
        :name => "Joao",
        :email => "email@example.com", #modifiquei
        :access_token => "Access Token",
        :uid => "Uid",
        :photo_url => "Photo Url",
        :provider => "email",
        :status => false,
        :reason => "Reason",
        :user_type => "2"
      ))
  end

  it "renders a list of invites" do
    render
    assert_select "tr>td", :text => "Name", :count => 2
    assert_select "tr>td", :text => "Description", :count => 2
    assert_select "tr>td", :text => "Joao", :count => 2
    assert_select "tr>td", :text => "Category", :count => 2
  end
end
