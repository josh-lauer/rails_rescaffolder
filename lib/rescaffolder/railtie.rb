require 'rails'

require 'rescaffolder/config'

module Rescaffolder
  class Railtie < ::Rails::Railtie
    initializer 'rescaffolder' do |app|
      require "rescaffolder/rescaffold"
      ActiveRecord::Base.send :include, Rescaffolder::Rescaffold
    end
  end
end