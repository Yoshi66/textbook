json.array!(@books) do |book|
  json.extract! book, :id, :category, :number, :user_id
  json.url book_url(book, format: :json)
end
