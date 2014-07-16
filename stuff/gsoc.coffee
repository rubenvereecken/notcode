$( ->
  $('#gimme').on 'click', fetchData
)

fetchData = ->
  jQuery.ajax("gsoc2014.json",
    'async': true
    'data':
      'fmt': 'json'
      'limit': 2000
      'idx': 0
    'success': populateTables
    'timeout': 30000
    'crossDomain': true
    'statusCode':
      403: onFetchError
    'error': onFetchError
  )

onFetchError = (jqXHR, textStatus, errorThrown) ->
  tableWrapper = $('#gsocTableWrapper')
  now = (new Date(Date.now())).toTimeString()
  errorMessage = $("<p><strong>No data available yet. Last check on #{now}.</strong></p>")
  tableWrapper.html errorMessage
  setTimeout(
    ->
      fetchData()
    , 10000)

populateTables = (data, status, jqXHR) ->
  console.debug status
  tableWrapper = $('#gsocTableWrapper')
  table = $('<table></table>')
  tableWrapper.html table

  newHeader = $('<tr><th>Mentors</th><th>Organization</th><th>Student</th><th>Title</th></tr>')
  table.append newHeader

  entries = data.data[""]
  for entry in entries
    columns = entry['columns']
    newRow = $('<tr></tr>')
    newRow.append "<td>#{columns['mentors']}</td>"
    newRow.append "<td>#{columns['organization']}</td>"
    newRow.append "<td>#{columns['student']}</td>"
    newRow.append "<td>#{columns['title']}</td>"

    table.append newRow