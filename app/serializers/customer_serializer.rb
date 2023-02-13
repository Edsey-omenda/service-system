class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name, :account_type, :account_number, :email, :age, :contact
end
