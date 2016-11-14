require 'rails_helper'

RSpec.describe "bets/index", type: :view do
  before(:each) do
    assign(:usuarios, [
      Usuario.create!(
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
      )])
    assign(:bets, [
      Bet.create!(
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
      ),
      Bet.create!(
        :name => "Name",
        :description => "Description",
        :usuario_id => 1,
        :url_photo => "Url Photo",
        :category => "Category",
        :room_status => 1,
        :room_type => 0,
        :stake => 5,
        :final_answer => "Final Answer",
        :answer_type => "Answer Type"
      )
    ])
  end

  it "renders a list of bets" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Joao".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => "Ativa", :count => 1
    assert_select "tr>td", :text => "Inativa", :count => 1
    assert_select "tr>td", :text => "Pública", :count => 0
    assert_select "tr>td", :text => "Privada", :count => 2
  end
end
