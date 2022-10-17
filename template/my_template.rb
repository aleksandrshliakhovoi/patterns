require_relative 'base_template'

class HTMLReport < BaseReport
  def format_report
    puts "HTMLReport"
  end
end


class TextReport < BaseReport
  def format_report
    puts "HTMLReport"
  end
end

TextReport.new.generate_report
HTMLReport.new.generate_report
BaseReport.new.generate_report
