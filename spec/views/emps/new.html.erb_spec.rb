require 'spec_helper'

describe "emps/new.html.erb" do
  before(:each) do
    assign(:emp, stub_model(Emp,
      :name => "MyString",
      :extension => 1
    ).as_new_record)
  end

  it "renders new emp form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => emps_path, :method => "post" do
      assert_select "input#emp_name", :name => "emp[name]"
      assert_select "input#emp_extension", :name => "emp[extension]"
    end
  end
end
