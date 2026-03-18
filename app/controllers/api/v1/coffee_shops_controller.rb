class Api::V1::CoffeeShopsController < ApplicationController
  def closest
    x = Float(params[:x]) rescue nil
    y = Float(params[:y]) rescue nil

    if x.nil? || y.nil?
      return render json: {
        errors: [
          {
            status: "400",
            title: "Invalid coordinates",
            detail: "Parameters x and y are required and must be numeric."
          }
        ]
      }, status: :bad_request
    end

    results = CoffeeShops::ClosestFinder.new(x, y).call

    if results.empty?
      return render json: {
        errors: [
          {
            status: "502",
            title: "Upstream data unavailable",
            detail: "Could not fetch or parse coffee shops data."
          }
        ]
      }, status: :bad_gateway
    end

    render json: {
      data: results.map do |shop|
        {
          type: "coffee_shops",
          id: shop[:name],
          attributes: {
            name: shop[:name],
            location: { x: shop[:x], y: shop[:y] },
            distance: shop[:distance]
          }
        }
      end
    }, status: :ok
  end
end
