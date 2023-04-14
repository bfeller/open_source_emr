module ApplicationHelper


  def dateify(date)
    date.strftime("%b %d, %Y")
  end
end
