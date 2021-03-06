class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :role, :phone

  def attributes(*args)
    data = super
    data[:auth_token] = object.auth_token if @instance_options[:show_auth_token]
    data
  end

end
