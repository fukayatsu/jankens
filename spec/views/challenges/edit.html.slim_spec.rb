require 'spec_helper'

describe "challenges/edit" do
  before(:each) do
    @challenge = assign(:challenge, stub_model(Challenge,
      :message => "MyText",
      :status => 1
    ))
  end

  it "renders the edit challenge form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => challenges_path(@challenge), :method => "post" do
      assert_select "textarea#challenge_message", :name => "challenge[message]"
      assert_select "input#challenge_status", :name => "challenge[status]"
    end
  end
end
