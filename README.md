
# CoffeeShops API

Simple Rails API that returns the three closest coffee shops to a given point, using data from a remote CSV file.

## Stack

- Ruby 3.2.4  
- Rails 8.1.2 (API-only)

## Setup

```bash
bundle install
bin/rails server
```

Server runs on `http://localhost:3000`.

## API

**Endpoint**

```http
GET /api/v1/coffee_shops/closest?x=47.6&y=-122.4
Accept: application/vnd.api+json
```

Returns at most three coffee shops, ordered from closest to farthest, with distances rounded to four decimals.

On error (invalid coordinates or CSV unavailable) it responds with a JSON `errors` array.

## Web UI

Static client available at:

- `http://localhost:3000/closest.html`

Enter `x` and `y`, click **Search**, and the page calls the API and shows the three closest coffee shops in a table.
```