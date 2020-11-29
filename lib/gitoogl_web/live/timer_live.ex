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
    started_at = Timex.now
    if connected?(socket), do: Process.send_after(self(), :update, 1000)
    {:ok, assign(socket, started_at: started_at, time: started_at)}
  end

  @impl true
  def handle_info(:update, socket) do
    time_now = Timex.diff(socket.assigns.started_at, Timex.now)
    Process.send_after(self(), :update, 1000)
    {:noreply, assign(socket, started_at: socket.assigns.started_at, time: time_now)}
  end

end
