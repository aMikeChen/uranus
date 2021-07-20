defmodule Uranus.Cache.Cachex do
  @behaviour Uranus.Cache

  @impl Uranus.Cache
  def get_value(key) do
    Cachex.get!(:my_cachex, key)
  end

  @impl Uranus.Cache
  def set_value(key, value, opt \\ []) do
    expiry = Keyword.get(opt, :expiry)

    parameters =
      []
      |> add_parameter(:expiry, expiry)

    Cachex.put(:my_cachex, key, value, parameters)
  end

  defp add_parameter(parameters, :expiry, nil), do: parameters
  defp add_parameter(parameters, :expiry, value), do: parameters ++ [ttl: :timer.seconds(value)]
end
