return {
  -- generic website options
  title       = "matthiashauber",
	description = "open-source tech stuff",
  website     = "https://matthiashauber.de",
  cname       = "matthiashauber.de",

  -- add "index.html" to the end of each link
  pagesuffix  = nil,

  -- folder that shall be scanned for content
  scanpath    = "content",

  -- the output directory that is later used as webroot
  www         = "www",

  -- modules that should be used for parsing
  modules     = { "html", "markdown", "gallery", "download", "footer" },

  -- define default colors
  colors      = {
    ["accent"]      = "#0269a4",
    ["border"]      = "#444444",
    ["bg-page"]     = "#444444",
    ["bg-content"]  = "#ffffff",
    ["bg-sidebar"]  = "#2e2d2b",
    ["fg-page"]     = "#000000",
    ["fg-sidebar"]  = "#ffffff",
    ["customcss"]   = ":not(pre) > code { background-color: #eeeeee; color: #000000; }";
  },
}
