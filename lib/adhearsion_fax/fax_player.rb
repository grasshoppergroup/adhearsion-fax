module AdhearsionFax
  class FaxPlayer < Adhearsion::CallController::Output::AbstractPlayer

    def output(content, options = {}, &block)
      options.merge! :render_documents => Array(content)

      component = Punchblock::Component::Output.new options

      if block
        controller.execute_component_and_await_completion component, &block
      else
        controller.execute_component_and_await_completion component
      end
    rescue Adhearsion::Call::Hangup
      raise
    rescue Adhearsion::Error, Punchblock::ProtocolError => e
      raise PlaybackError, "Output failed due to #{e.inspect}"
    end
  end
end
