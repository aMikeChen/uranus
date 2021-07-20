defmodule Uranus.Cache.Redis do
  @behaviour Uranus.Cache

  @impl Uranus.Cache
  def get_value(key) do
    Redix.command(:redix, ["GET", key])
    |> elem(1)
  end

  @impl Uranus.Cache
  def set_value(key, value, opt \\ []) do
    expiry = Keyword.get(opt, :expiry)

    parameters =
      []
      |> add_parameter(:set, key, value)
      |> add_parameter(:expiry, expiry)

    Redix.command(:redix, parameters)
  end

  defp add_parameter(parameters, :set, key, value), do: parameters ++ ["SET", key, value]
  defp add_parameter(parameters, :expiry, nil), do: parameters
  defp add_parameter(parameters, :expiry, value), do: parameters ++ ["EX", value]
end
