# frozen_string_literal: true

# breadcrumbs builder powered by breadcrumbs_on_rails gem.
class PrefixBreadcrumbsBuilder < BreadcrumbsOnRails::Breadcrumbs::Builder
  def render
    @context.render '/breadcrumbs/prefix', elements: @elements
  end
end
