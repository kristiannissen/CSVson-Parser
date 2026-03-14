#
#
#
require 'csv'

CSV::Converters[:array] = lambda do |value|
  if value.is_a?(String) && value.include?(',')
    value.split(',').map(&:strip)
  else
    value
  end  
end
