module AdhearsionFax
  class Plugin < Adhearsion::Plugin
    # Actions to perform when the plugin is loaded
    #
    init :adhearsion_fax do
      logger.warn "AdhearsionFax has been loaded"
    end

    # Basic configuration for the plugin
    #
    config :adhearsion_fax do
      greeting "Hello", :desc => "What to use to greet users"
    end

    # Defining a Rake task is easy
    # The following can be invoked with:
    #   rake plugin_demo:info
    #
    tasks do
      namespace :adhearsion_fax do
        desc "Prints the PluginTemplate information"
        task :info do
          STDOUT.puts "AdhearsionFax plugin v. #{VERSION}"
        end
      end
    end

  end
end
