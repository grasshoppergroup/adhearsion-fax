require 'adhearsion'
require 'adhearsion_fax'

require 'coveralls'
Coveralls.wear!

RSpec.configure do |config|
  config.color_enabled = true
  config.tty = true

  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  config.before(:all) do
    Adhearsion::Plugin.initializers.each do |plugin_initializer|
      plugin_initializer.run
    end
  end
end

