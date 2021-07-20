defmodule UranusWeb.CurrencyController do
  use UranusWeb, :controller

  alias Uranus.{Cache, Coin}

  def show(conn, %{"pair" => pair}) do
    [symbol, convert] = String.split(pair, "-")
    price = latest_price(symbol, convert)

    render(conn, "show.json", %{price: price})
  end

  defp latest_price(symbol, convert) do
    key = symbol <> convert

    case Cache.Redis.get_value(key) do
      nil ->
        price = Coin.latest_price(symbol, convert)
        Cache.Redis.set_value(key, price, expiry: 10)
        price

      price ->
        String.to_float(price)
    end
  end
end
