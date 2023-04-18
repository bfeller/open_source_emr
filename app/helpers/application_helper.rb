module ApplicationHelper


  def dateify(date)
    unless date.nil?
      date.strftime("%b %d, %Y")
    end
  end
end
