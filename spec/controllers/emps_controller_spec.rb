require 'spec_helper'

describe EmpsController do

  def mock_emp(stubs={})
    (@mock_emp ||= mock_model(Emp).as_null_object).tap do |emp|
      emp.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all emps as @emps" do
      Emp.stub(:all) { [mock_emp] }
      get :index
      assigns(:emps).should eq([mock_emp])
    end
  end

  describe "GET show" do
    it "assigns the requested emp as @emp" do
      Emp.stub(:find).with("37") { mock_emp }
      get :show, :id => "37"
      assigns(:emp).should be(mock_emp)
    end
  end

  describe "GET new" do
    it "assigns a new emp as @emp" do
      Emp.stub(:new) { mock_emp }
      get :new
      assigns(:emp).should be(mock_emp)
    end
  end

  describe "GET edit" do
    it "assigns the requested emp as @emp" do
      Emp.stub(:find).with("37") { mock_emp }
      get :edit, :id => "37"
      assigns(:emp).should be(mock_emp)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created emp as @emp" do
        Emp.stub(:new).with({'these' => 'params'}) { mock_emp(:save => true) }
        post :create, :emp => {'these' => 'params'}
        assigns(:emp).should be(mock_emp)
      end

      it "redirects to the created emp" do
        Emp.stub(:new) { mock_emp(:save => true) }
        post :create, :emp => {}
        response.should redirect_to(emp_url(mock_emp))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved emp as @emp" do
        Emp.stub(:new).with({'these' => 'params'}) { mock_emp(:save => false) }
        post :create, :emp => {'these' => 'params'}
        assigns(:emp).should be(mock_emp)
      end

      it "re-renders the 'new' template" do
        Emp.stub(:new) { mock_emp(:save => false) }
        post :create, :emp => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested emp" do
        Emp.should_receive(:find).with("37") { mock_emp }
        mock_emp.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :emp => {'these' => 'params'}
      end

      it "assigns the requested emp as @emp" do
        Emp.stub(:find) { mock_emp(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:emp).should be(mock_emp)
      end

      it "redirects to the emp" do
        Emp.stub(:find) { mock_emp(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(emp_url(mock_emp))
      end
    end

    describe "with invalid params" do
      it "assigns the emp as @emp" do
        Emp.stub(:find) { mock_emp(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:emp).should be(mock_emp)
      end

      it "re-renders the 'edit' template" do
        Emp.stub(:find) { mock_emp(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested emp" do
      Emp.should_receive(:find).with("37") { mock_emp }
      mock_emp.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the emps list" do
      Emp.stub(:find) { mock_emp }
      delete :destroy, :id => "1"
      response.should redirect_to(emps_url)
    end
  end

end
