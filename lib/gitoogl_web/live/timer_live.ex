defmodule GitooglWeb.TimerLive do
  use GitooglWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    started_at = DateTime.utc_now
    if connected?(socket), do: Process.send_after(self(), :update, 1000)
    {:ok, assign(socket, started_at: started_at, time: "00:00:00")}
  end

  @impl true
  @spec handle_info(:update, Phoenix.LiveView.Socket.t()) :: {:noreply, any}
  def handle_info(:update, socket) do
    time_since_now = DateTime.diff(DateTime.utc_now, socket.assigns.started_at)
    Process.send_after(self(), :update, 1000)
    {:noreply, assign(socket, started_at: socket.assigns.started_at, time: beautify_date(time_since_now))}
  end

  defp beautify_date(timestamp) do
    {:ok, date} = DateTime.from_unix(timestamp)
    "#{format(date.hour)}:#{format(date.minute)}:#{format(date.second)}"
  end

  defp format(number) when number < 10 do
    "0#{number}"
  end

  defp format(number) when number >= 10 do
    "#{number}"
  end

end
