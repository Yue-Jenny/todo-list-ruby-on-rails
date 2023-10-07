# frozen_string_literal: true

module Api
  module V1
    class ApplicationService
      def self.call(*args, &block)
        new(*args, &block).call
      end
    end
  end
end
