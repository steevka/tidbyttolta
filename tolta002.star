load("cache.star", "cache")
load("encoding/base64.star", "base64")
load("encoding/json.star", "json")
load("http.star", "http")
load("render.star", "render")
load("schema.star", "schema")
load("xpath.star", "xpath")

COINDESK_PRICE_URL = "https://embed.tolta.co/6a946e6df44dd32f8e150e10b3a35c86/"

def main():
    rep = http.get(COINDESK_PRICE_URL)
    if rep.status_code != 200:
        fail("Coindesk request failed with status %d", rep.status_code)

        selector = html(tolta_page_response.body())
        parsed = selector.find("body").first().text()

    return render.Root(
        child = render.Text(parsed)
    )
