require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :image => "Image"
      ),
      User.create!(
        :image => "Image"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Image".to_s, :count => 2
  end
end
