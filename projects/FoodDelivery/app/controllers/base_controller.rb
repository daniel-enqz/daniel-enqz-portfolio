class BaseController
  def list
    all = @repository.all
    @view.display(all)
  end

  def delete
    list
    index = @view.ask_for_index
    @repository.remove(index)
    list
  end

  def edit
    # list
    # index = @view.ask_for_index
    # to_edit = @repository.edit_customer(index)
    # name = @view.ask_for("customer name?")
    # address = @view.ask_for("customer address?")
    # to_edit.name = name
    # to_edit.address = address
    # list
  end
end
