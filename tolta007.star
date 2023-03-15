load("cache.star", "cache")
load("encoding/json.star", "json")
load("html.star", "html")
load("http.star", "http")
load("render.star", "render")
load("schema.star", "schema")

TOLTA_URL = "https://embed.tolta.co/e61df466f39192db6cebd7ef19621c75"

def main():
    rep = http.get(TOLTA_URL)
    parsed = html(rep.body())

    return render.Root(
        child = render.Text(parsed)
