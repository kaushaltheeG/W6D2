require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...
    return @columns if @columns
    cols = DBConnection.execute2("SELECT * FROM #{table_name}")
    @columns = cols.first.map(&:to_sym)

  end

  def self.finalize!
    columns.each do |col|
      define_method("#{col}=".to_sym) do |new_val|
        attributes[col] = new_val
      end 

      define_method("#{col}".to_sym) { attributes[col] }
    end 
  end

  def self.table_name=(table_name)
    # ...
    @table_name = table_name.to_s.downcase + 's'

  end

  def self.table_name
    @table_name = self.to_s.downcase + 's'
    # ...
  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # ...
    params.each do |key, val| 
      key_sym = key.to_sym
      raise "unknown attribute '#{key}'" if !self.class.columns.include?(key_sym)
      send("#{key_sym}=", val)
    end 

  end

  def attributes
    # ...
    @attributes ||= {}
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
