defmodule SimpleFormWeb.SimpleFormLive do
  use SimpleFormWeb,  :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, number: 5)
  {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <%= @number %>
    <.button phx-click="add"> Add</.button>
    """
  end

  def handle_event("add", _params, socket) do
    socket = assign(socket, number: socket.assigns.number + 1)
    {:noreply, socket}
  end
end
