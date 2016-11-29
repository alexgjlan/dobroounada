require 'rails_helper'

RSpec.describe "bets/new", type: :view do
  before(:each) do
    assign(:bet, Bet.new(
      :name => "MyString",
      :description => "MyString",
      :usuario_id => 3,
      :url_photo => "MyString",
      :category => "MyString",
      :room_status => 1,
      :room_type => 1,
      :stake => 1,
      :final_answer => "MyString",
      :answer_type => "MyString"
    ))
  end

  it "renders new bet form" do
    render

    assert_select "form[action=?][method=?]", bets_path, "post" do

      assert_select "input#bet_name[name=?]", "bet[name]"

      assert_select "textarea#bet_description[name=?]", "bet[description]"

      assert_select "select#bet_usuario_id[name=?]", "bet[usuario_id]"

      assert_select "input#bet_url_photo[name=?]", "bet[url_photo]"

      assert_select "input#bet_category[name=?]", "bet[category]"

      assert_select "input#bet_room_status_1[name=?]", "bet[room_status]"
      
      assert_select "input#bet_room_status_0[name=?]", "bet[room_status]"

      assert_select "input#bet_room_type_1[name=?]", "bet[room_type]"
      
      assert_select "input#bet_room_type_0[name=?]", "bet[room_type]"

      assert_select "input#bet_stake[name=?]", "bet[stake]"

      assert_select "input#bet_final_answer[name=?]", "bet[final_answer]"

      assert_select "select#bet_answer_type[name=?]", "bet[answer_type]"
    end
  end
end
