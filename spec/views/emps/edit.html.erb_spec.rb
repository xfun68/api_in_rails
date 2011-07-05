require 'spec_helper'

describe "emps/edit.html.erb" do
  before(:each) do
    @emp = assign(:emp, stub_model(Emp,
      :name => "MyString",
      :extension => 1
    ))
  end

  it "renders the edit emp form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => emp_path(@emp), :method => "post" do
      assert_select "input#emp_name", :name => "emp[name]"
      assert_select "input#emp_extension", :name => "emp[extension]"
    end
  end
end
