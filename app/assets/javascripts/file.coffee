$(document).on 'ready page:load', ->
  $(document).on 'ajax:success', 'form.fetch-url', (e, data, status, xhr) ->
    $(this).siblings('input.url').val data['presigned_url']
    return
  $(document).on 'ajax:error', 'form.fetch-url', (e, data, status, xhr) ->
    $(this).siblings('input.url').val data['presigned_url']
    alert 'Failed.'
    return
  return
