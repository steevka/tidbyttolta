
load("cache.star", "cache")
load("encoding/base64.star", "base64")
load("encoding/json.star", "json")
load("http.star", "http")
load("render.star", "render")
load("schema.star", "schema")
load("xpath.star", "xpath")

URL = "https://embed.tolta.co/6a946e6df44dd32f8e150e10b3a35c86/"

def main():
    rep = http.get(URL)
    if rep.status_code != 200:
        fail("Coindesk request failed with status %d", rep.status_code)
    else
        selector = html(URL.body())
        parsed = selector.find("body").first().text()

    return render.Root(
        child = render.Text(parsed)
    )
