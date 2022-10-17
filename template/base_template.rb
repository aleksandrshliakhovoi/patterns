class BaseReport
  def generate_report
    get_worktime
    format_report
    send_report
  end

  def get_worktime
    puts 'get_worktime'
  end

  def format_report
    raise NotImplementedError
  end

  def send_report
    reverse_timer
    puts "#{self} sending report"
  end

  private

  def reverse_timer
    1.upto(3) do |num|
      puts "#{num} before sending, you could abort the operation"
      sleep 0.5
    end
  end
end
