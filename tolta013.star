load("cache.star", "cache")
load("encoding/json.star", "json")
load("html.star", "html")
load("http.star", "http")
load("render.star", "render")
load("schema.star", "schema")

TOLTA_URL = "https://embed.tolta.co/e61df466f39192db6cebd7ef19621c75"

def main():
    html_string = http.get(TOLTA_URL).decode() # convert to string

    # Find the start and end index of the body tag
    start_index = html_string.find("<body>")
    end_index = html_string.find("</body>") + len("</body>")

    # Extract the body content
    body_content = html_string[start_index:end_index]

    return render.Root(
        child = render.Text(body_content)
    )
