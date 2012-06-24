require 'spec_helper'

describe "challenges/show" do
  before(:each) do
    @challenge = assign(:challenge, stub_model(Challenge,
      :from_message => "MyText",
      :from_user_id => 1,
      :from_choice => 2,
      :to_message => "MyText",
      :to_user_id => 3,
      :to_choice => 4,
      :status => "Status",
      :allow_draw => false,
      :result => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/MyText/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/Status/)
    rendered.should match(/false/)
    rendered.should match(/MyText/)
  end
end
