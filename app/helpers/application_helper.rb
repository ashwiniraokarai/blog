#this helper file is automatically available to all views. All they have to do is call the method they want.
module ApplicationHelper
  def format_time_stamp(time_stamp)
    time_stamp.strftime("%B %e, %Y")
  end
end
