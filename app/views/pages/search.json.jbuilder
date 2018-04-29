json.products do
  json.array!(@products) do |product|
    json.name product.title
    json.url product_path(product)
  end
end

json.categories do
  json.array!(@categories) do |category|
    json.name category.title
  end
end
