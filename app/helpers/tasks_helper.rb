module TasksHelper

  def css_for(task)
    if task.status == "todo"
      'important'
    elsif task.status == "ongoing"
      'warning'
    elsif task.status == "test"
      'success'
    else
      'info'
    end
  end

  def background_color(task)
    if task.status == "todo"
      '#9d261d'
    elsif task.status == "ongoing"
      '#4bb1cf'
    elsif task.status == "test"
      '#80699B'
    else
      '#5eb95e'
    end
  end
end

