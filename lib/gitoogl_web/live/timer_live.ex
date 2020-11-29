defmodule GitooglWeb.TimerLive do
  use GitooglWeb, :live_view

  @impl true
  def render(assigns) do
    ~L"""
      Current Date: <%= @time %>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket), do: Process.send_after(self(), :update, 1000)
    {:ok, assign(socket, time: DateTime.utc_now())}
  end

  @impl true
  def handle_info(:update, socket) do
    Process.send_after(self(), :update, 1000)
    {:noreply, assign(socket, :time, DateTime.utc_now())}
  end

end
