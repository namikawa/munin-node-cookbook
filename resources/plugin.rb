actions :enable, :disable, :install
default_action :enable

attribute :key, :kind_of => String, :name_attribute => true
attribute :script_name, :kind_of => String, :required => true

def initialize(*args)
  super
  @action = :enable
end
