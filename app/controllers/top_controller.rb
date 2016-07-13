# frozen_string_literal: true

# top page class.
class TopController < ApplicationController
  def show
    redirect_to(buckets_path)
  end
end
