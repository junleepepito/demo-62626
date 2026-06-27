Jekyll::Hooks.register :site, :after_init do
  require "safe_yaml"

  module JekyllAdmin
    class Server
      private

      def parsed_configuration
        config = SafeYAML.load_file(configuration_path)
        config["jekyll_admin"] ||= {}
        config
      end
    end
  end
end
