# frozen_string_literal: true

class HealthController < ApplicationController
  def check
    render json: { status: 'ok' }
  end
end
