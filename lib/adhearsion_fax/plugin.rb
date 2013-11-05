module AdhearsionFax
  class Plugin < Adhearsion::Plugin

    init :adhearsion_fax do
      Adhearsion::CallController.class_eval do
        include AdhearsionFax::ControllerMethods
      end

      logger.info "AdhearsionFax loaded"
    end

    config :adhearsion_fax do
    end
  end
end
