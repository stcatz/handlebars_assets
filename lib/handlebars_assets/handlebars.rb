# Based on https://github.com/josh/ruby-coffee-script
require 'execjs'
require 'pathname'

module HandlebarsAssets
  class Handlebars
    class << self
      def precompile(*args)
        context.call('EmberSinatra.precompile', *args)
      end

      private

      def context
        @context ||= ExecJS.compile(source)
      end

      def source
        @source ||= path.read
      end

      def path
        @path ||= assets_path.join('ember.js')
      end

      def assets_path
        @assets_path ||= Pathname(HandlebarsAssets.path)
      end
    end
  end
end
