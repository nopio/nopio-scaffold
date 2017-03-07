require 'generators/nopio_scaffold/generator_helpers'

module NopioScaffold
  module Generators
    # Custom scaffold generator
    class ControllerGenerator < Rails::Generators::NamedBase
      include Rails::Generators::ResourceHelpers
      include NopioScaffold::Generators::GeneratorHelpers

      source_root File.expand_path('../templates', __FILE__)

      desc "Generates controller, controller_spec and views for the model with the given NAME."

      class_option :skip_show, type: :boolean, default: false, desc: "Skip \"show\" action"

      def copy_controller_and_spec_files
        template "controller.rb", File.join("app/controllers", "#{controller_file_name}_controller.rb")
        template "spec/controller.rb", File.join("spec/controllers", "#{controller_file_name}_controller_spec.rb")
      end

      def copy_view_files
        directory_path = File.join("app/views", controller_file_path)
        empty_directory directory_path

        view_files.each do |file_name|
          template "views/#{file_name}.html.erb", File.join(directory_path, "#{file_name}.html.erb")
        end
      end

      def add_routes
        routes_string = "resources :#{plural_name}"
        routes_string += ', except: :show' unless show_action?
        route routes_string
      end

      def add_abilities
        ability_string = "\n    can :manage, #{class_name}, user_id: user.id"
        inject_into_file "#{Rails.root}/app/models/ability.rb", ability_string, after: /def initialize[a-z()]+/i
      end
    end
  end
end
