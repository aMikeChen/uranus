defmodule UranusWeb.CurrencyView do
  use UranusWeb, :view

  def render("show.json", %{price: price}) do
    %{price: price}
  end
end
