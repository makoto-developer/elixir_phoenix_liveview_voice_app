# MyVoiceApp

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4040`](http://localhost:4040) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## memo

```shell

We are almost there! The following steps are missing:

    $ cd my_voice_app

Then configure your database in config/dev.exs and run:

    $ mix ecto.create

Start your Phoenix app with:

    $ mix phx.server

You can also run your app inside IEx (Interactive Elixir) as:

    $ iex -S mix phx.server
```

## STUNとは

STUNは、WebRTCなどのP2P通信で、NAT（Network Address Translation）を通過するための技術。
通常、家庭のルーターや企業のネットワークでは、内部ネットワークのIPアドレス(プライベートIP)が使われる。
しかし、P2P通信をする場合、相手のデバイスはインターネット側のIPアドレス(パブリックIP)を知る必要がある。
そこで、STUNサーバーを使うことで自分のパブリックIPアドレスを取得し直接通信できるようにする。

## STUNの代替サーバー

Google以外さまざまなSTUNサーバー

✅ 無料で使えるSTUNサーバー

|サーバー|アドレス|
|:---|:---|
|key|value|
|Google STUN|stun:stun.l.google.com:19302|
|Open STUN|stun:stun1.l.google.com:19302|
|Twilio STUN|stun:global.stun.twilio.com:3478|
|Coturn STUN|stun:stun1.voipstunt.com:3478|

## STUNだけで大丈夫？

STUNはP2P通信の補助をするものですが、すべてのネットワーク環境で必ず動作するわけではない。

特に、企業ネットワークやモバイルキャリアのNATでは、STUNでは通過できないことがある。

その場合は、TURN（Traversal Using Relays around NAT）サーバーが必要となる。

STUNとTURNの違い

|項目|STUN|TURN|
|:---|:---|:---|
|key|value|comment|
|目的|パブリックIPの取得|通信を中継|
|NAT超え|基本的なNAT超え対応|厳しいNATでも通過可能|
|サーバー負荷|軽い（P2P接続ができる）|高い（データ転送が必要）|
|コスト|無料で使える|独自運用 or 有料|

TURNを使う場合は、以下のように設定します。

```elixir
let peerConnection = new RTCPeerConnection({
  iceServers: [
    { urls: "stun:stun.l.google.com:19302" },
    { urls: "turn:turn.example.com:3478", username: "user", credential: "pass" }
  ]
});

```
