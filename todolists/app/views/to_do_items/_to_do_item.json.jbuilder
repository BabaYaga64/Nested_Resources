json.extract! to_do_item, :id, :title, :due_date, :description, :completed, :created_at, :updated_at
json.url to_do_item_url(to_do_item, format: :json)