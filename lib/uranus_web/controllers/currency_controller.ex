defmodule UranusWeb.CurrencyController do
  use UranusWeb, :controller

  alias Uranus.Coin

  @cache_module Application.get_env(:uranus, :coin_cache)[:module]

  def show(conn, %{"pair" => pair}) do
    [symbol, convert] = String.split(pair, "-")
    price = latest_price(symbol, convert)

    render(conn, "show.json", %{price: price})
  end

  defp latest_price(symbol, convert) do
    key = symbol <> convert

    case @cache_module.get_value(key) do
      nil ->
        price = Coin.latest_price(symbol, convert)
        @cache_module.set_value(key, price, expiry: 10)
        price

      price ->
        String.to_float(price)
    end
  end
end
