class MiviUday
  require 'json'

  def self.read_file(file_path)
	file = File.read(file_path)
	data_hash = JSON.parse(file)
	user_data = data_hash["data"]["attributes"]
	phone_no = user_data["contact-number"]
	email = user_data["email-address"]
	full_name = user_data["title"] + ". "+ user_data["first-name"] + " " + user_data["last-name"]
	product_name = nil
	data_hash["included"].each do |data|
		if data["type"] == "products"
			product_name = data["attributes"]["name"]
		end
    end
	{phone_no: phone_no,email: email,name: full_name,product: product_name}
  end

end