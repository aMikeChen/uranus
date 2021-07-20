defmodule Uranus.Redix.Cache do
  @behaviour Uranus.Cache

  @impl Uranus.Cache
  def get_value(key) do
    Redix.command(:redix, ["GET", key])
    |> elem(1)
  end

  def set_value(key, value, opt \\ []) do
    expiry = Keyword.get(opt, :expiry)

    parameter = generate_parameter([], :expiry, expiry)

    expiry = Keyword.get(opt, :expiry)
    Redix.command(:redix, ["SET", key, value, "EX", expiry] ++ parameter)
  end

  defp generate_parameter(parameter, :expiry, value), do: parameter ++ ["EX", Integer.to_string(value)]
  defp generate_parameter(parameter, _key, nil), do: parameter
end
