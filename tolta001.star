"""
Applet: Tolta.co Stats
Author: Steve Rybka
Summary: Shows tolta.co numbers
Description: Display any stat from your tolta.co account
"""

load("encoding/base64.star", "base64")
load("encoding/json.star", "json")
load("http.star", "http")
load("render.star", "render")

BASE_URL = "https://embed.tolta.co/6a946e6df44dd32f8e150e10b3a35c86/"

BTC_ICON = base64.decode("""
iVBORw0KGgoAAAANSUhEUgAAABEAAAARCAYAAAA7bUf6AAAAlklEQVQ4T2NkwAH+H2T/jy7FaP+
TEZtyDEG4Zi0TTPXXzoDF0A1DMQRsADbN6MZdO4NiENwQbAbERh1lWLzMmgFGo5iFZBDYEFwuwG
sISCPUIKyGgDRjAyBXYXMNIz5XgDQga8TpLboYgux8DO/AwoUuLiEqTLBFMcmxQ7V0gssgklIsL
AYozjsoBoE45OZi5DRBSnkCAMLhlPBiQGHlAAAAAElFTkSuQmCC
""")

def main():
    rep = http.get(BASE_URL)
    if rep.status_code != 200:
        fail("Tolta data failed", rep.status_code)
    else:
        tolta_data = re.findall ('body', rep.body())


    return render.Root(
        child = render.Box( # This Box exists to provide vertical centering
            render.Row(
                expanded=True, # Use as much horizontal space as possible
                main_align="space_evenly", # Controls horizontal alignment
                cross_align="center", # Controls vertical alignment
                children = [
                    render.Image(src=BTC_ICON),
                    render.Text(tolta_data),
                ],
            ),
        ),
    )
