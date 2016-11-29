=begin 

require 'rails_helper'

RSpec.describe "bets/show", type: :view do
  before(:each) do
    @user = assign(:usuarios, Usuario.create!(
        :id => 2,
        :name => "Leo",
        :email => "email@example.com", #modifiquei
        :access_token => "Access Token",
        :uid => "Uid",
        :photo_url => "Photo Url",
        :provider => "email",
        :status => false,
        :reason => "Reason",
        :user_type => "2"
      ))
    @bet = assign(:bet, Bet.create!(
      :name => "Name",
      :description => "Description",
      :usuario_id => 2,
      :url_photo => "Url Photo",
      :category => "Category",
      :room_status => 3,
      :room_type => 4,
      :stake => 5,
      :final_answer => "Final Answer",
      :answer_type => "Answer Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Leo/)
    expect(rendered).to match(/Url Photo/)
    expect(rendered).to match(/Category/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/Final Answer/)
    expect(rendered).to match(/Answer Type/)
  end
end

=end