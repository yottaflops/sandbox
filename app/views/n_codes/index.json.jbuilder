json.array!(@n_codes) do |n_code|
  json.extract! n_code, :id, :term
  json.url n_code_url(n_code, format: :json)
end
