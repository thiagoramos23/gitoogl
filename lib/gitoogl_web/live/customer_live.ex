defmodule GitooglWeb.CustomerLive do
  use GitooglWeb, :live_view

  alias Gitoogl.Manager

  @impl true
  @spec mount(any, any, Phoenix.LiveView.Socket.t()) :: {:ok, any}
  def mount(_params, _session, socket) do
    {:ok, assign(socket, customers: Manager.list_customers)}
  end

  @impl true
  def handle_event("add", %{"customer" => })
end
