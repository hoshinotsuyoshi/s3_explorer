class PrefixBreadcrumbsBuilder < BreadcrumbsOnRails::Breadcrumbs::Builder
  def render
    @context.render "/breadcrumbs/prefix", elements: @elements
  end
end
