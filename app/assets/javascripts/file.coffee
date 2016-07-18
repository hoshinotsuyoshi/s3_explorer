$(document).on 'ready page:load', ->
  $(document).on 'ajax:success', 'a.fetch-url', (e, data, status, xhr) ->
    $(this).siblings('input.url').val data['presigned_url']
    return
  $(document).on 'ajax:error', 'a.fetch-url', (e, data, status, xhr) ->
    alert 'Failed.'
    return
  $(document).on 'focus', 'input.url', () ->
    $(this).select();
  $(document).on 'click', 'input.url', () ->
    $(this).select();
  return
