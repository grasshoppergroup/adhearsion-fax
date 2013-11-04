require 'spec_helper'

module AdhearsionFax
  describe ControllerMethods do
    describe "mixed in to a CallController" do

      class TestController < Adhearsion::CallController
        include AdhearsionFax::ControllerMethods
      end

      let(:mock_call) { double 'Call' }

      subject { TestController.new mock_call }

    end
  end
end
