module ApplicationHelper
  def country_name(country_code)
    return if country_code.nil? || country_code.strip.empty?

    country = ISO3166::Country[country_code]
    if country
      country.translations[I18n.locale.to_s] || country.common_name || country.iso_short_name
    else
      "Unknown Country"
    end
  end
end