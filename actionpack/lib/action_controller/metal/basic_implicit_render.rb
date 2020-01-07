# frozen_string_literal: true

module ActionController
  module BasicImplicitRender # :nodoc:
    def run_action(*args)
      run.tap { default_render unless performed? }
    end

    def default_render
      head :no_content
    end
  end
end
