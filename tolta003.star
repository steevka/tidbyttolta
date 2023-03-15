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
        fail("nope", rep.status_code)
    else
        selector = html(URL.body())
        parsed = selector.find(document.body)

    return render.Root(
    child = render.Box( # This Box exists to provide vertical centering
        render.Row(
            expanded=True, # Use as much horizontal space as possible
            main_align="space_evenly", # Controls horizontal alignment
            cross_align="center", # Controls vertical alignment
            children = [
                render.Text("$%d" % parsed),
            ],
        ),
    ),
)
