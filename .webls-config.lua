return {
  -- generic website options
  title       = "matthiashauber",
  description = "open-source tech stuff",
  website     = "https://matthiashauber.de",
  cname       = "matthiashauber.de",
  head        = "../.head.html",

  -- add "index.html" to the end of each link
  pagesuffix  = nil,

  -- folder that shall be scanned for content
  scanpath    = "content",

  -- the output directory that is later used as webroot
  www         = "www",

  -- modules that should be used for parsing
  modules     = { "html", "markdown", "gallery", "download", "footer" },

  -- module config
  markdown = {
    extensions = { ".md" }
  },

  gallery = {
    extensions = { ".png", ".jpg", ".jpeg", ".webp", ".gif", ".svg" }
  },

  download = {
    extensions = { ".pdf", ".gz", ".bz2", ".xz", ".zip", ".rar" }
  },

  -- define default colors
  colors      = {
    ["accent"]      = "#7bb794",
    ["border"]      = "#1f2933",
    ["bg-page"]     = "#1f2933",
    ["bg-content"]  = "#3e4c59",
    ["bg-sidebar"]  = "#1f2933",
    ["fg-page"]     = "#f5f7fa",
    ["fg-sidebar"]  = "#f5f7fa",
    ["customcss"]   = ":not(pre) > code { padding: 3px; }";
  },
}
