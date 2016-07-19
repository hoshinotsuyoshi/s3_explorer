$(document).on 'ready page:load', ->

  # clipboard in modal window
  $(document).on 'ajax:success', 'a.fetch-url', (e, data, status, xhr) ->
    $(this).siblings('input.url').val data['presigned_url']

    # create clipboard when only a.fetch-url is clicked && ajax succeeded
    clipboard = new Clipboard('#' + $(this).siblings('button.btn')[0].id)

    clipboard.on 'success', (e) ->
      e.clearSelection()

    return

  $(document).on 'ajax:error', 'a.fetch-url', (e, data, status, xhr) ->
    alert 'Failed.'
    return

  # download button in file list
  $(document).on 'ajax:success', 'a.download-file', (e, data, status, xhr) ->
    # download directly
    location.href = data['presigned_url']

  $(document).on 'ajax:error', 'a.download-file', (e, data, status, xhr) ->
    alert 'Failed.'
    return

  # auto-all-select is useful.
  $(document).on 'focus', 'input.url', () ->
    $(this).select();
  $(document).on 'click', 'input.url', () ->
    $(this).select();
  return
