require 'spec_helper'

describe Complain do
  before { @complain = Complain.new(detail: "Example problem", subject: "example" , solution: "solution example" , user_id: 1 ) }

  subject { @complain }

  it { should respond_to(:detail) }
  it { should respond_to(:subject) }
  it { should respond_to(:solution) }
  it { should respond_to(:user_id) }
   
  describe "when detail is not present" do
    before { @complain.detail = " " }
    it { should_not be_valid }
  end
 describe "when subject is not present" do
    before { @complain.subject = " " }
    it { should_not be_valid }
  end
  describe "when solution is not present" do
    before { @complain.solution = " " }
    it { should_not be_valid }
  end
  describe "when user_id is not present" do
    before { @complain.user_id = " " }
    it { should_not be_valid }
  end
  
  
    
end
