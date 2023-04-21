# frozen_string_literal: true

# 2.両替
def convert_currency(amount, source_currency, target_currency, conversion_rates)
  puts(amount / conversion_rates[source_currency] * conversion_rates[target_currency])
end

conversion_rates = {
  usd: 1.0,
  jpy: 110.0,
  eur: 0.8
}
convert_currency(100, :usd, :jpy, conversion_rates)
