require 'spec_helper'

module AdhearsionFax
  describe ControllerMethods do

    def expect_fax_output(fax_documents, options = {})
      component = Punchblock::Component::Output.new(options.merge(render_documents: fax_documents))
      subject.should_receive(:execute_component_and_await_completion).once.with(component)
    end

    let(:mock_call) { double 'Call' }

    subject { Adhearsion::CallController.new mock_call }

    describe "#fax_player" do
      it "should return a Player component targetted at the current subject" do
        fax_player = subject.fax_player
        fax_player.should be_a AdhearsionFax::FaxPlayer
        fax_player.controller.should be subject
      end

      it "should return the same fax_player every time" do
        subject.fax_player.should be subject.fax_player
      end
    end

    describe "#send_fax" do
      let(:expected_doc_one) do
        Punchblock::Component::Output::FaxDocument.new(
          url: "http://example.com/shakespere.tiff",
          pages: 1..4,
          header: "Faxtime"
        )
      end

      let(:expected_doc_two) do
        Punchblock::Component::Output::FaxDocument.new(
          url: "http://foo.com/bar.tiff",
          pages: 1..2,
          header: "Faxtime"
        )
      end

      it "sends a fax" do
        expect_fax_output [expected_doc_one]
        subject.send_fax "http://example.com/shakespere.tiff", pages: 1..4, header: 'Faxtime'
      end

      it "sends two faxes with a shared option" do
        expect_fax_output [expected_doc_one, expected_doc_two]
        subject.send_fax({"http://example.com/shakespere.tiff" => {pages: 1..4}, "http://foo.com/bar.tiff" => {pages: 1..2}}, {header: 'Faxtime'})
      end
    end

    describe "#receive_fax" do
      let(:input_component) { Punchblock::Component::ReceiveFax.new }
      let(:complete_event)  { Punchblock::Component::ReceiveFax::Complete::Finish.new }

      before do
        complete_event.stub fax: double(url: "http://bar.com", resolution: "595x841")
        Punchblock::Component::ReceiveFax.any_instance.stub(complete?: true, complete_event: complete_event)
      end

      it "receives a fax" do
        subject.should_receive(:execute_component_and_await_completion).once.with(input_component).and_return input_component
        subject.receive_fax.should == complete_event
      end
    end
  end
end
