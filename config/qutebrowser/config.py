config.load_autoconfig(False)
c.backend = "webengine"

# editor
c.editor.command = ["nvim", "{file}", "-c", "normal {line}G{column0}l"]

# security
c.content.autoplay = False
c.content.canvas_reading = True
c.content.cookies.accept = "no-unknown-3rdparty"
c.content.dns_prefetch = False
c.content.geolocation = False
c.content.headers.accept_language = "en-US,en;q=0.5"
c.content.headers.referer = "same-domain"
c.content.headers.do_not_track = True
c.content.javascript.enabled = True
c.content.webgl = True
c.content.webrtc_ip_handling_policy = "disable-non-proxied-udp"
c.content.media.audio_capture = False
c.content.media.video_capture = False
c.content.media.audio_video_capture = False
c.content.mouse_lock = False

# content
c.content.notifications = False
c.url.default_page = "~/github/dotfiles/config/qutebrowser/startpage/index.html"
c.url.start_pages = "~/github/dotfiles/config/qutebrowser/startpage/index.html"
c.url.searchengines = {"DEFAULT": "https://duckduckgo.com/?q={}"}

# Bindings for normal mode
config.bind("j", "scroll-px 0 100")
config.bind("k", "scroll-px 0 -100")
config.bind("M", "hint links spawn mpv {hint-url}")
config.bind("Z", "hint links spawn alacritty -e youtube-dl {hint-url}")
config.bind("xb", "config-cycle statusbar.show always never")
config.bind("xt", "config-cycle tabs.show always never")
config.bind(
    "xx",
    "config-cycle statusbar.show always never;; config-cycle tabs.show always never",
)

# theme
config.source("gruvbox.py")
