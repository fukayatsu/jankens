require 'spec_helper'

describe "challenges/index" do
  before(:each) do
    assign(:challenges, [
      stub_model(Challenge,
        :from_message => "MyText",
        :from_user_id => 1,
        :from_choice => 2,
        :to_message => "MyText",
        :to_user_id => 3,
        :to_choice => 4,
        :status => "Status",
        :allow_draw => false,
        :result => "MyText"
      ),
      stub_model(Challenge,
        :from_message => "MyText",
        :from_user_id => 1,
        :from_choice => 2,
        :to_message => "MyText",
        :to_user_id => 3,
        :to_choice => 4,
        :status => "Status",
        :allow_draw => false,
        :result => "MyText"
      )
    ])
  end

  it "renders a list of challenges" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
