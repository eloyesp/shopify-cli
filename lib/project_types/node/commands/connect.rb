# frozen_string_literal: true
module Node
  class Command
    class Connect < ShopifyCli::SubCommand
      def call(*)
        if ShopifyCli::Project.has_current? && ShopifyCli::Project.current.env
          @ctx.puts(@ctx.message("node.connect.production_warning"))
        end

        app = ShopifyCli::Commands::Connect.new.default_connect("node")
        @ctx.done(@ctx.message("node.connect.connected", app))
      end

      def self.help
        ShopifyCli::Context.message("node.connect.help", ShopifyCli::TOOL_NAME, ShopifyCli::TOOL_NAME)
      end
    end
  end
end
