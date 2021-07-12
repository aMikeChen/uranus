defmodule UranusWeb.CurrencyController do
  use UranusWeb, :controller

  def show(conn, %{"pair" => pair}) do
    [symbol, convert] = String.split(pair, "-")
    price = Uranus.Coin.latest_price(symbol, convert)
    render(conn, "show.json", %{price: price})
  end
end
