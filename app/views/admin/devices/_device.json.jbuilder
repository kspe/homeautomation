json.extract! device, :id, :name, :ip_address, :created_at, :updated_at
json.url device_url(device, format: :json)