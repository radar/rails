# frozen_string_literal: true

module ActionController
  module BasicImplicitRender # :nodoc:
    def send_action(*args)
      super.tap { default_render unless performed? }
    end

    def run_action(*args)
      send_action(:run, *args)
    end

    def default_render
      head :no_content
    end
  end
end
