defmodule Uranus.Coin do
  @api_url "https://sandbox-api.coinmarketcap.com"
  @api_key "b54bcf4d-1bca-4e8e-9a24-22ff2c3d462c"

  def latest_price(symbol, convert) do
    case retrieve_latest_quotes(symbol, convert) do
      {:ok, %{body: body}} ->
        body
        |> Jason.decode!()
        |> get_in(["data", symbol, "quote", convert, "price"])

      {:error, error} ->
        {:error, error}
    end
  end

  defp retrieve_latest_quotes(symbol, convert) do
    HTTPoison.get(
      "#{@api_url}/v1/cryptocurrency/quotes/latest",
      [Accept: "application/json", "X-CMC_PRO_API_KEY": @api_key],
      params: [symbol: symbol, convert: convert]
    )
  end
end
