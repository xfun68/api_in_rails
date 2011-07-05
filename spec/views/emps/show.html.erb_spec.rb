require 'spec_helper'

describe "emps/show.html.erb" do
  before(:each) do
    @emp = assign(:emp, stub_model(Emp,
      :name => "Name",
      :extension => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
