# frozen_string_literal: true
class TopController < ApplicationController
  def show
    redirect_to(buckets_path)
  end
end
