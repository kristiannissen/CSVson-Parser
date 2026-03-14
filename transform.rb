#
#
#
#
require 'csv'
require 'json'
require_relative 'converters'

class Transform
  # 
  def self.parse(input, output, options = {})
    # Default options
    defaults = {
      col_sep: ',',
      converters: [:array]
    }
    # Merge default options and options
    config = defaults.merge(options)
    # Number of rows processed
    rows_processed = 0

    # Open output and process
    CSV.open(output, 'wb', col_sep: config[:col_sep]) do |csv_out|
      # Add headers to file
      csv_out << ['style', 'attributes']

      CSV.foreach(input, headers: true, col_sep: config[:col_sep], converters: config[:converters]) do |row|
        data = row.to_h
        # Style is key
        style = data.delete('style')

        # Create CSVson format
        csv_out << [style, JSON.generate(data)]
        rows_processed += 1
      end
    end

    # Return rows_processed
    rows_processed
  end
end
