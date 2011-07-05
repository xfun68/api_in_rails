require "spec_helper"

describe EmpsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/emps" }.should route_to(:controller => "emps", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/emps/new" }.should route_to(:controller => "emps", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/emps/1" }.should route_to(:controller => "emps", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/emps/1/edit" }.should route_to(:controller => "emps", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/emps" }.should route_to(:controller => "emps", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/emps/1" }.should route_to(:controller => "emps", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/emps/1" }.should route_to(:controller => "emps", :action => "destroy", :id => "1")
    end

  end
end
