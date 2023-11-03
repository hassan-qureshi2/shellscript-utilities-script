response=$(curl 'https://londinium.swell.store/api/cart/items' \
  -H 'authority: londinium.swell.store' \
  -H 'accept: application/json' \
  -H 'accept-language: en-US,en;q=0.9' \
  -H 'authorization: Basic cGtfcHdBUDBDRDd1M0tMcDdTZ1JqZjJ5bUhraUVHOWdISE0=' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -H 'cookie: swell-session=33354b7d1432303ae9ee11c1903c7eaa%3Ac731abf03fdbb66b319dac5d644afd653741846abee5efec1742e56d8f2860255b2b9c80d5dbe2de47b96cc5fff996f379f45e0c; swell-currency=GBP; swell-locale=en-AU' \
  -H 'origin: https://londinium.swell.store' \
  -H 'pragma: no-cache' \
  -H 'referer: https://londinium.swell.store/products/compressa/' \
  -H 'sec-ch-ua: "Google Chrome";v="117", "Not;A=Brand";v="8", "Chromium";v="117"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Linux"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-origin' \
  -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36' \
  -H 'x-currency: GBP' \
  -H 'x-locale: en-AU' \
  -H 'x-session: 33354b7d1432303ae9ee11c1903c7eaa:c731abf03fdbb66b319dac5d644afd653741846abee5efec1742e56d8f2860255b2b9c80d5dbe2de47b96cc5fff996f379f45e0c' \
  --data-raw '{"product_id":"64699d3d6000a0001265ff9c","quantity":1,"options":[{"id":"Power & Plug","value":"120V, 1400W, USA plug"},{"id":"Steam Arm Side","value":"Right"},{"id":"Inclusion: Wenge Portafilter #1","value":"Bottomless"},{"id":"Pre-pay Duty & Taxes","value":"No"}],"purchase_option":{"type":"standard"}}' \
  --compressed)

checkout_id=$(echo "$response" | jq -r '.checkout_id')
echo "Checkout ID: $checkout_id"
echo -n "$checkout_id" | xsel -i -b
echo "Checkout ID copied to clipboard."

exit 0
