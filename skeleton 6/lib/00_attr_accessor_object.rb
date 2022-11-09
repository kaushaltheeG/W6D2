class AttrAccessorObject
  def self.my_attr_accessor(*names)
    # ...
    names.each do |name|
       define_method("#{name}=".to_sym) do |new_val|
          instance_variable_set("@#{name}", new_val)
       end 

       define_method("#{name}".to_sym) {instance_variable_get("@#{name}")}
    end 
    
  end
end
