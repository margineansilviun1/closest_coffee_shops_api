require "net/http"
require "csv"

class CoffeeShops::ClosestFinder
    CSV_URL = "https://raw.githubusercontent.com/Agilefreaks/test_oop/master/coffee_shops.csv"

    def initialize(x, y)
      @x = x.to_f
      @y = y.to_f
    end

    def call
      rows = fetch_rows
      return [] if rows.nil? # if csv unreadable

      shops = build_shops(rows)
      shops_with_distance = shops.map do |shop|
        distance = euclidean_distance(shop[:x], shop[:y])
        shop.merge(distance: distance.round(4))
      end

      shops_with_distance.sort_by { |shop| shop[:distance] }.first(3)
    end

    def build_shops(rows)
      rows.filter_map do |row|
        name, x_str, y_str = row
        next if name.nil? || name.strip.empty?

        x = Float(x_str) rescue nil
        y = Float(y_str) rescue nil
        next if x.nil? || y.nil?

        { name:, x:, y: }
       end
    end

    def euclidean_distance(shop_x, shop_y)
      Math.sqrt((shop_x - @x)**2 + (shop_y - @y)**2)
    end

    private

    def fetch_rows
      uri = URI(CSV_URL)
      response = Net::HTTP.get_response(uri)

      return nil unless response.is_a?(Net::HTTPSuccess)

      CSV.parse(response.body)
    end
end
