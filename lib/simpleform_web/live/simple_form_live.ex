defmodule SimpleFormWeb.SimpleFormLive do
  use SimpleFormWeb,  :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, number: 1000)
    socket = assign(socket, test: 45345)
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <%= assigns.number %>
    <%= assigns.test %>

    <strong>Hello</strong>
    """
  end
end
