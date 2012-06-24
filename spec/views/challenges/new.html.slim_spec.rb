require 'spec_helper'

describe "challenges/new" do
  before(:each) do
    assign(:challenge, stub_model(Challenge,
      :from_message => "MyText",
      :from_user_id => 1,
      :from_choice => 1,
      :to_message => "MyText",
      :to_user_id => 1,
      :to_choice => 1,
      :status => "MyString",
      :allow_draw => false,
      :result => "MyText"
    ).as_new_record)
  end

  it "renders new challenge form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => challenges_path, :method => "post" do
      assert_select "textarea#challenge_from_message", :name => "challenge[from_message]"
      assert_select "input#challenge_from_user_id", :name => "challenge[from_user_id]"
      assert_select "input#challenge_from_choice", :name => "challenge[from_choice]"
      assert_select "textarea#challenge_to_message", :name => "challenge[to_message]"
      assert_select "input#challenge_to_user_id", :name => "challenge[to_user_id]"
      assert_select "input#challenge_to_choice", :name => "challenge[to_choice]"
      assert_select "input#challenge_status", :name => "challenge[status]"
      assert_select "input#challenge_allow_draw", :name => "challenge[allow_draw]"
      assert_select "textarea#challenge_result", :name => "challenge[result]"
    end
  end
end
