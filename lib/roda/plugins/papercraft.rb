# frozen_string_literal: true

require "papercraft"
require "fileutils"

class Roda
  module RodaPlugins
    module Papercraft
      # Set the file to load the routes metadata from.  Options:
      # :file :: The JSON file containing the routes metadata (default: 'routes.json')
      def self.configure(app, opts = {})
        template_root = opts[:template_root] || File.join(FileUtils.pwd, "templates")

        app.instance_exec do
          @template_root ||= template_root
        end
      end

      module ClassMethods
        def template_root
          @template_root
        end
      end
      
      module InstanceMethods
        def render(*, **, &block)
          block.render(*, **)
        end

        def template(name)
          (@templates ||= {})[name] ||= load_template(name)
        end

        private

        def load_template(name)
          fn = File.join(self.class.template_root, "#{name}.rb")
          source = IO.read(fn)
          eval(source, binding, fn)
        end
      end
    end

    register_plugin(:papercraft, Papercraft)
  end
end
