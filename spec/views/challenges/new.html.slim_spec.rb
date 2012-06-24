require 'spec_helper'

describe "challenges/new" do
  before(:each) do
    assign(:challenge, stub_model(Challenge,
      :message => "MyText",
      :status => 1
    ).as_new_record)
  end

  it "renders new challenge form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => challenges_path, :method => "post" do
      assert_select "textarea#challenge_message", :name => "challenge[message]"
      assert_select "input#challenge_status", :name => "challenge[status]"
    end
  end
end
