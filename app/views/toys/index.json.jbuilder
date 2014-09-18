json.array!(@toys) do |toy|
  json.extract! toy, :id, :document_number, :excerpts, :html_url, :type, :title
  json.url toy_url(toy, format: :json)
end
