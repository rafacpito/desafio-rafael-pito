json.extract! citizen, :id, :fullname, :cpf, :cns, :email, :birth_date, :telephone, :status, :photo, :created_at, :updated_at
json.url citizen_url(citizen, format: :json)
