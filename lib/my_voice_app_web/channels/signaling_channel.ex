defmodule MyVoiceAppWeb.SignalingChannel do
  use Phoenix.Channel

  def join("call:" <> _room_id, _message, socket) do
    {:ok, socket}
  end

  def handle_in("offer", %{"offer" => offer}, socket) do
    broadcast!(socket, "offer", %{offer: offer})
    {:noreply, socket}
  end

  def handle_in("answer", %{"answer" => answer}, socket) do
    broadcast!(socket, "answer", %{answer: answer})
    {:noreply, socket}
  end
end
