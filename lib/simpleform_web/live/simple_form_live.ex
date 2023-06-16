defmodule SimpleFormWeb.SimpleFormLive do
  use SimpleFormWeb,  :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, number: 0, form: to_form(%{adding_amount_defalut: 3}))
  {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <%= @number %>
    <.button phx-click="add"> Add</.button>

    <.simple_form for={@form} phx-submit="adding_more">
      <.input field={@form[:add_amount]}value={@form.params.adding_amount_defalut}></.input>
      <.button> Add more   </.button>
    </.simple_form>


    """
  end

  def handle_event("add", _params, socket) do
    socket = assign(socket, number: socket.assigns.number + 1)
    {:noreply, socket}
  end

  def handle_event("adding_more",  %{"add_amount" => the_added_amount}, socket) do
    amount_to_add_by = case Integer.parse(the_added_amount) do
      {number, _} ->  number
      _ -> 0
    end
    socket = assign(socket, number: socket.assigns.number + amount_to_add_by, form: to_form(%{adding_amount_defalut: the_added_amount}))
  {:noreply, socket}
  end
end
