# frozen_string_literal: true

Creditario::Client.api_base = Rails.configuration.creditario.dig("api_base")
Creditario::Client.api_key = Rails.configuration.creditario.dig("api_key")
