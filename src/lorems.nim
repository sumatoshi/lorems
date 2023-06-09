import std/strutils, std/sysrand, std/algorithm
 
## Texts is generated by lipsum.com.

const loremIpsumText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sit amet risus tortor. In eget odio quis nulla suscipit condimentum a in purus. Mauris non consequat dolor, pharetra aliquet sem. Vivamus quis libero sit amet nisl placerat efficitur. Nunc eleifend vestibulum urna, eget sagittis urna rhoncus vitae. Fusce in congue lacus. Mauris sit amet nisl commodo, aliquet sem id, porta velit. Suspendisse vulputate, est nec imperdiet dignissim, felis nulla congue diam, in dignissim turpis est at augue. Cras consectetur, velit eget condimentum sollicitudin, ex metus rutrum nulla, nec sodales est metus eget est. Aenean volutpat eros et dui sollicitudin lacinia. Vivamus ultricies nisl risus, quis dapibus quam tincidunt sit amet."

const fishLines = @[
  @["Lorem", "ipsum", "dolor", "sit", "amet,", "consectetur", "adipiscing", "elit.", "Vestibulum", "sit", "amet", "risus", "tortor.", "In", "eget", "odio", "quis", "nulla", "suscipit", "condimentum", "a", "in", "purus.", "Mauris", "non", "consequat", "dolor,", "pharetra", "aliquet", "sem.", "Vivamus", "quis", "libero", "sit", "amet", "nisl", "placerat", "efficitur.", "Nunc", "eleifend", "vestibulum", "urna,", "eget", "sagittis", "urna", "rhoncus", "vitae.", "Fusce", "in", "congue", "lacus.", "Mauris", "sit", "amet", "nisl", "commodo,", "aliquet", "sem", "id,", "porta", "velit.", "Suspendisse", "vulputate,", "est", "nec", "imperdiet", "dignissim,", "felis", "nulla", "congue", "diam,", "in", "dignissim", "turpis", "est", "at", "augue.", "Cras", "consectetur,", "velit", "eget", "condimentum", "sollicitudin,", "ex", "metus", "rutrum", "nulla,", "nec", "sodales", "est", "metus", "eget", "est.", "Aenean", "volutpat", "eros", "et", "dui", "sollicitudin", "lacinia.", "Vivamus", "ultricies", "nisl", "risus,", "quis", "dapibus", "quam", "tincidunt", "sit", "amet."],
  @["Phasellus", "odio", "arcu,", "tristique", "ut", "est", "ut,", "congue", "hendrerit", "dolor.", "Etiam", "iaculis", "eget", "lorem", "ac", "tempus.", "Sed", "vehicula", "leo", "vitae", "ultricies", "sodales.", "Proin", "auctor", "tortor", "vitae", "consectetur", "maximus.", "Fusce", "nec", "lorem", "quis", "ipsum", "tempus", "vehicula", "id", "non", "arcu.", "Pellentesque", "vitae", "tincidunt", "libero,", "vel", "vestibulum", "est.", "In", "vel", "dictum", "dolor,", "a", "porta", "metus.", "Cras", "sollicitudin,", "tortor", "volutpat", "vulputate", "ultricies,", "metus", "odio", "rhoncus", "tellus,", "ut", "fringilla", "metus", "quam", "at", "est.", "Proin", "placerat", "ornare", "sem.", "Proin", "rutrum", "eros", "a", "scelerisque", "bibendum.", "Donec", "eget", "interdum", "lacus.", "Quisque", "ac", "purus", "hendrerit,", "semper", "velit", "id,", "condimentum", "eros.", "Sed", "nunc", "lacus,", "sollicitudin", "sed", "magna", "eget,", "blandit", "porttitor", "nunc.", "Vestibulum", "id", "ex", "dui."],
  @["Mauris", "sed", "efficitur", "ex,", "ac", "euismod", "magna.", "Donec", "rutrum", "et", "risus", "in", "malesuada.", "Donec", "eu", "placerat", "nisl.", "Quisque", "porta", "nisi", "ac", "tellus", "viverra", "porta.", "Nullam", "tincidunt,", "libero", "in", "facilisis", "efficitur,", "lacus", "neque", "luctus", "odio,", "vel", "placerat", "lacus", "nulla", "non", "odio.", "Donec", "velit", "tellus,", "porta", "vitae", "odio", "eget,", "scelerisque", "pellentesque", "justo.", "Ut", "quis", "purus", "porttitor", "leo", "egestas", "cursus.", "Donec", "ultricies", "lorem", "eget", "bibendum", "hendrerit.", "Duis", "est", "orci,", "ultrices", "vel", "elementum", "facilisis,", "laoreet", "vel", "nisl.", "Ut", "finibus,", "magna", "eu", "facilisis", "ullamcorper,", "felis", "quam", "finibus", "lorem,", "ut", "ornare", "lorem", "lectus", "pharetra", "nisi.", "Vivamus", "eu", "magna", "nunc.", "Aliquam", "quis", "rhoncus", "turpis,", "quis", "hendrerit", "enim.", "Aliquam", "sit", "amet", "congue", "mauris,", "non", "tincidunt", "urna.", "Ut", "tempus", "euismod", "ipsum,", "ac", "maximus", "risus", "imperdiet", "vitae.", "Sed", "semper", "ac", "est", "eget", "consectetur.", "Sed", "at", "massa", "id", "purus", "facilisis", "semper."],
  @["Integer", "ac", "velit", "nec", "neque", "tempus", "pharetra.", "Sed", "a", "arcu", "ut", "ex", "volutpat", "posuere.", "Ut", "egestas", "neque", "eu", "ex", "fringilla", "hendrerit.", "Praesent", "fringilla", "nisi", "at", "arcu", "malesuada", "fermentum.", "Sed", "quis", "nibh", "quis", "neque", "dignissim", "efficitur", "vel", "ut", "urna.", "Nam", "bibendum", "urna", "ex,", "vitae", "sodales", "ex", "finibus", "quis.", "Integer", "lobortis", "libero", "in", "tellus", "ultrices", "luctus.", "Morbi", "felis", "justo,", "dignissim", "vel", "lacinia", "nec,", "molestie", "nec", "metus.", "Quisque", "quis", "leo", "vehicula", "orci", "dictum", "efficitur.", "Vivamus", "dapibus", "neque", "at", "ornare", "dictum.", "Aliquam", "egestas", "neque", "at", "rutrum", "mattis.", "Suspendisse", "porta", "dui", "vitae", "sagittis", "egestas.", "Cras", "pulvinar,", "mauris", "vitae", "fringilla", "hendrerit,", "tortor", "eros", "placerat", "mi,", "eget", "ornare", "mi", "enim", "non", "risus.", "Donec", "vel", "placerat", "justo.", "Vestibulum", "id", "urna", "at", "sapien", "sodales", "aliquet", "eu", "a", "lectus.", "Sed", "tempus", "sed", "sem", "nec", "ultricies."],
  @["Nullam", "luctus", "tempus", "arcu", "sed", "vehicula.", "Maecenas", "placerat", "sed", "mauris", "eu", "iaculis.", "Mauris", "tristique", "eleifend", "faucibus.", "In", "vestibulum", "nisi", "eget", "auctor", "consectetur.", "Aliquam", "rutrum", "est", "ut", "justo", "tempus", "suscipit.", "Sed", "nisl", "arcu,", "tincidunt", "vitae", "massa", "finibus,", "pretium", "rhoncus", "magna.", "Duis", "in", "augue", "eget", "ipsum", "iaculis", "varius", "a", "sit", "amet", "nisl.", "Nam", "suscipit", "magna", "est,", "et", "auctor", "nisl", "rhoncus", "quis.", "Mauris", "pellentesque", "ipsum", "turpis,", "vitae", "iaculis", "est", "blandit", "in.", "Nam", "id", "laoreet", "metus.", "Phasellus", "bibendum", "mi", "id", "ligula", "rutrum", "eleifend.", "Ut", "lacinia", "massa", "felis,", "eu", "ultrices", "arcu", "bibendum", "in.", "Class", "aptent", "taciti", "sociosqu", "ad", "litora", "torquent", "per", "conubia", "nostra,", "per", "inceptos", "himenaeos.", "Duis", "lacinia", "mattis", "ornare.", "Suspendisse", "vitae", "nunc", "non", "tellus", "bibendum", "maximus."],
  @["Nulla", "facilisi.", "In", "at", "finibus", "sapien.", "Proin", "lectus", "turpis,", "feugiat", "nec", "congue", "sit", "amet,", "varius", "vel", "ex.", "Nullam", "ut", "placerat", "orci.", "Etiam", "suscipit", "ullamcorper", "urna", "nec", "convallis.", "Nullam", "molestie", "aliquam", "consequat.", "Maecenas", "vitae", "tristique", "neque,", "vel", "pharetra", "nunc.", "Aliquam", "ante", "lectus,", "commodo", "in", "elit", "sed,", "posuere", "interdum", "eros.", "Vestibulum", "at", "ex", "non", "urna", "ultricies", "accumsan", "nec", "quis", "justo."],
  @["Donec", "varius", "nec", "erat", "et", "eleifend.", "Morbi", "a", "lacinia", "purus.", "Duis", "consequat,", "sem", "eget", "commodo", "consequat,", "ligula", "lectus", "consequat", "est,", "ut", "convallis", "quam", "augue", "quis", "ex.", "Fusce", "a", "nisi", "ante.", "Donec", "mollis", "justo", "eros,", "sed", "ultrices", "erat", "volutpat", "eu.", "Fusce", "ipsum", "dolor,", "placerat", "ac", "nisi", "eget,", "mattis", "eleifend", "arcu.", "Nam", "quis", "fringilla", "enim.", "Aenean", "ullamcorper", "augue", "eget", "fringilla", "interdum.", "Phasellus", "tristique", "metus", "vitae", "venenatis", "faucibus.", "Quisque", "sed", "faucibus", "nulla.", "Donec", "quis", "mollis", "lectus.", "Vivamus", "non", "diam", "quis", "ante", "vestibulum", "porttitor.", "Integer", "id", "commodo", "purus,", "ut", "ullamcorper", "orci."],
  @["Morbi", "consequat", "finibus", "tellus,", "id", "finibus", "quam", "facilisis", "vitae.", "Fusce", "nec", "sagittis", "augue.", "Sed", "vel", "suscipit", "augue.", "Nunc", "accumsan", "scelerisque", "massa", "sed", "aliquam.", "Morbi", "vel", "lorem", "ultricies,", "auctor", "neque", "et,", "dapibus", "est.", "Cras", "diam", "nibh,", "molestie", "vitae", "facilisis", "vitae,", "scelerisque", "ac", "ex.", "Cras", "ac", "faucibus", "nisl,", "quis", "molestie", "turpis.", "Morbi", "massa", "purus,", "tempus", "eu", "facilisis", "elementum,", "luctus", "varius", "lorem."],
  @["Etiam", "tristique", "tincidunt", "tempor.", "Suspendisse", "consectetur", "sollicitudin", "ex", "nec", "viverra.", "In", "interdum", "nunc", "sit", "amet", "diam", "porttitor,", "et", "iaculis", "ligula", "congue.", "Fusce", "vestibulum", "ex", "ut", "libero", "tincidunt,", "non", "faucibus", "massa", "tristique.", "Aenean", "massa", "ex,", "posuere", "ac", "facilisis", "vitae,", "interdum", "nec", "elit.", "Nunc", "purus", "purus,", "feugiat", "ac", "sagittis", "eget,", "consectetur", "eget", "felis.", "Suspendisse", "viverra", "consequat", "sapien", "et", "fermentum.", "Morbi", "id", "nisi", "vitae", "nulla", "gravida", "rutrum", "nec", "at", "est.", "Aenean", "commodo,", "metus", "id", "efficitur", "sodales,", "libero", "arcu", "sollicitudin", "mauris,", "eget", "scelerisque", "arcu", "odio", "at", "elit.", "Praesent", "molestie", "porttitor", "est", "eu", "dignissim."],
  @["Pellentesque", "pulvinar", "eros", "vitae", "eros", "laoreet,", "eget", "egestas", "libero", "tincidunt.", "Cras", "mollis", "ligula", "id", "elit", "mattis,", "non", "laoreet", "dolor", "euismod.", "Curabitur", "in", "dignissim", "mauris,", "sit", "amet", "maximus", "metus.", "Aliquam", "sed", "justo", "erat.", "Aenean", "scelerisque", "vitae", "arcu", "et", "interdum.", "Curabitur", "fringilla", "lectus", "ac", "eleifend", "malesuada.", "Praesent", "eu", "ex", "nec", "leo", "sagittis", "interdum.", "Nunc", "nulla", "est,", "malesuada", "ac", "interdum", "sodales,", "tincidunt", "ac", "neque."],
  @["Donec", "molestie", "sagittis", "augue,", "vel", "pretium", "mi", "mollis", "vitae.", "Sed", "sagittis", "lacinia", "arcu", "a", "fringilla.", "Nam", "bibendum", "nisi", "ut", "nisl", "rutrum,", "et", "gravida", "odio", "luctus.", "Donec", "et", "commodo", "lacus,", "eget", "commodo", "felis.", "Sed", "eu", "eros", "pulvinar,", "dapibus", "ex", "non,", "eleifend", "nulla.", "Maecenas", "elementum", "magna", "tellus,", "eget", "egestas", "risus", "vehicula", "nec.", "Suspendisse", "non", "massa", "in", "nulla", "sollicitudin", "tempus.", "Vestibulum", "ante", "ipsum", "primis", "in", "faucibus", "orci", "luctus", "et", "ultrices", "posuere", "cubilia", "curae;", "Nullam", "pulvinar", "aliquam", "iaculis.", "Phasellus", "ac", "turpis", "aliquet,", "mattis", "purus", "vitae,", "iaculis", "odio.", "Quisque", "eget", "imperdiet", "justo.", "Maecenas", "nec", "quam", "sit", "amet", "metus", "congue", "accumsan", "vel", "et", "tellus.", "Integer", "a", "accumsan", "nunc."],
  @["Ut", "nec", "sollicitudin", "purus.", "In", "maximus", "molestie", "lorem,", "at", "dapibus", "lectus", "rhoncus", "sed.", "Sed", "augue", "ante,", "vulputate", "non", "fermentum", "ut,", "fermentum", "viverra", "eros.", "Nulla", "ac", "massa", "id", "libero", "ornare", "venenatis", "a", "ac", "metus.", "Curabitur", "maximus", "tellus", "metus,", "ut", "feugiat", "neque", "aliquet", "id.", "Donec", "iaculis", "vehicula", "magna", "ac", "facilisis.", "Phasellus", "at", "efficitur", "augue.", "Mauris", "tincidunt", "mauris", "mauris,", "mattis", "pharetra", "justo", "ullamcorper", "id.", "Duis", "at", "eleifend", "magna.", "Nullam", "iaculis", "a", "libero", "et", "sollicitudin.", "Nulla", "a", "mollis", "ligula,", "eu", "lobortis", "enim."],
  @["Nulla", "sodales", "eros", "placerat", "elit", "aliquet", "dictum.", "Aliquam", "rutrum", "iaculis", "diam,", "id", "mollis", "elit", "iaculis", "tincidunt.", "Curabitur", "dignissim", "placerat", "accumsan.", "Etiam", "rutrum", "tempor", "consequat.", "Donec", "bibendum,", "purus", "in", "faucibus", "facilisis,", "velit", "mi", "tristique", "tellus,", "vel", "iaculis", "massa", "sapien", "in", "ex.", "Class", "aptent", "taciti", "sociosqu", "ad", "litora", "torquent", "per", "conubia", "nostra,", "per", "inceptos", "himenaeos.", "Curabitur", "a", "nisi", "vehicula,", "ultrices", "massa", "vulputate,", "euismod", "lacus.", "Praesent", "velit", "mi,", "interdum", "non", "tempor", "in,", "pretium", "ut", "nisi.", "Mauris", "ac", "blandit", "tortor.", "Proin", "et", "dolor", "vulputate,", "gravida", "neque", "a,", "malesuada", "turpis.", "Cras", "congue,", "sem", "nec", "vehicula", "luctus,", "arcu", "sapien", "rutrum", "nunc,", "sed", "dictum", "orci", "massa", "ac", "velit."],
  @["Cras", "vel", "molestie", "libero.", "Fusce", "tellus", "dui,", "ornare", "vitae", "metus", "vel,", "sodales", "ultrices", "purus.", "Nam", "in", "porta", "nibh,", "vitae", "congue", "dolor.", "Donec", "id", "elementum", "sapien,", "vel", "laoreet", "neque.", "Nunc", "laoreet", "sit", "amet", "magna", "at", "pulvinar.", "Curabitur", "mi", "orci,", "euismod", "sit", "amet", "venenatis", "ac,", "tincidunt", "sit", "amet", "orci.", "Vivamus", "elementum", "dui", "id", "faucibus", "hendrerit.", "Aliquam", "at", "odio", "non", "tortor", "vehicula", "egestas", "nec", "sit", "amet", "velit.", "Aenean", "ullamcorper", "aliquet", "justo", "eget", "convallis.", "Donec", "pulvinar", "nisl", "diam,", "ac", "dictum", "sem", "luctus", "a.", "Maecenas", "id", "enim", "et", "augue", "dignissim", "vulputate", "in", "vel", "velit.", "Vestibulum", "id", "placerat", "ante.", "Phasellus", "a", "velit", "sit", "amet", "leo", "aliquam", "suscipit", "a", "a", "tellus.", "Morbi", "et", "ante", "id", "neque", "convallis", "gravida.", "Suspendisse", "tristique", "scelerisque", "urna,", "dignissim", "convallis", "risus", "vehicula", "vitae."],
  @["Integer", "id", "ligula", "congue,", "bibendum", "eros", "eget,", "dignissim", "metus.", "Suspendisse", "potenti.", "Aenean", "mollis", "faucibus", "erat,", "id", "vehicula", "arcu", "cursus", "eget.", "Mauris", "lorem", "elit,", "interdum", "et", "mauris", "ac,", "sodales", "lobortis", "nulla.", "Aliquam", "et", "metus", "at", "nisl", "pharetra", "ultricies.", "Fusce", "sit", "amet", "tincidunt", "magna,", "id", "dapibus", "diam.", "Phasellus", "rutrum", "nulla", "eu", "venenatis", "gravida.", "Donec", "in", "arcu", "sollicitudin,", "luctus", "justo", "id,", "semper", "erat.", "Donec", "luctus,", "tellus", "eu", "fermentum", "sagittis,", "massa", "arcu", "ullamcorper", "erat,", "at", "luctus", "nisi", "ex", "scelerisque", "elit.", "Phasellus", "quis", "ligula", "rhoncus,", "vulputate", "augue", "vel,", "fermentum", "sapien."],
  @["Vivamus", "pulvinar,", "eros", "in", "venenatis", "finibus,", "nunc", "metus", "pharetra", "eros,", "eu", "maximus", "mauris", "ipsum", "id", "risus.", "Maecenas", "maximus", "bibendum", "mauris,", "vitae", "efficitur", "nibh", "suscipit", "a.", "Proin", "dignissim", "risus", "vitae", "viverra", "auctor.", "Nunc", "iaculis", "neque", "eget", "commodo", "luctus.", "Aenean", "ut", "ante", "sed", "nisi", "scelerisque", "hendrerit.", "Pellentesque", "vitae", "congue", "felis.", "Nam", "sodales", "dui", "ac", "maximus", "hendrerit.", "Vivamus", "dictum,", "enim", "vel", "efficitur", "ornare,", "enim", "libero", "aliquet", "metus,", "in", "semper", "dui", "tellus", "nec", "diam.", "Etiam", "in", "faucibus", "libero,", "tempor", "suscipit", "felis.", "Donec", "scelerisque", "facilisis", "enim.", "In", "volutpat", "nisl", "a", "urna", "ultrices,", "quis", "porttitor", "enim", "cursus.", "Nulla", "eu", "pretium", "elit.", "Vivamus", "posuere", "vulputate", "lorem,", "eget", "tincidunt", "felis", "ullamcorper", "in."],
  @["Nulla", "luctus", "orci", "a", "viverra", "tincidunt.", "Sed", "imperdiet", "cursus", "justo", "non", "ullamcorper.", "Nunc", "at", "porttitor", "massa.", "Proin", "tincidunt", "pretium", "egestas.", "Morbi", "eu", "tortor", "ac", "est", "imperdiet", "tristique", "vitae", "sodales", "ligula.", "Vivamus", "tortor", "felis,", "semper", "non", "auctor", "id,", "aliquet", "sit", "amet", "justo.", "Vivamus", "malesuada", "nisl", "a", "mauris", "congue", "malesuada.", "Quisque", "eget", "tristique", "urna.", "Proin", "accumsan", "tellus", "ex,", "a", "elementum", "libero", "euismod", "quis.", "In", "hac", "habitasse", "platea", "dictumst."]
]

const llen = fishLines.len # safety range 🙏

type LoremFmt* = enum
  lfNone = "none"
    ## "\n"
  lfLine = "newline"
    ## "\n\n"
  lfHtml = "html"
    ## "<ul><li>...</li></ul>

proc randBytes(): array[llen, byte] =
  result = [1'u8, 7, 14, 10, 6, 4, 3,
            5, 9, 13, 11, 8, 15, 2, 16, 12, 1]

  when nimvm: # sysrand don't work with wm
    discard
  else:
    var
      rands = newSeqUninitialized[byte](llen)
      getRand = urandom(dest = rands)

    if likely getRand: # suggestions?
      result.sort do (x, y: byte) -> int:
        if rands[x] > rands[y]: result = 1
        else: result = -1

proc wordify(len: Positive, src = newSeq[string]()): seq[string] =
  result = src

  if result.len < len:
    var
      rands = randBytes()
      i = 0

    while result.len < len:
      let index = rands[i mod llen]
      result.add fishLines[index]
      inc i

  result.setLen(len)

proc toText(words: seq[string]): string =
  for w in words:
    result.add w & " "

  result.removeSuffix {' ', ',', '.'}
  result.add '.'

# ----------- public -----------

proc loremIpsum*: string = loremIpsumText
  ## Get accuraly "Lorem ipsum..." line.

proc loremWords*(wNum: Positive, loremStart = true): string =
  ## Get 1 line with `wNum` word count.
  ## Starts with "Lorem ipsum..." if `loremStart`.
  if loremStart:
    result = wordify(wNum, fishLines[0]).toText
  else:
    result = wordify(wNum).toText

proc loremLines*(pNum, wNum: Positive, loremStart = true,
                 lfmt = lfLine): string =
  ## Get `pNum` number of lorem paragraphs with `wNum`
  ## word length each and `lfmt` formatting. No random in vm.
  ## Starts with "Lorem ipsum..." if `loremStart`.
  var pCount = 0

  case lfmt
  of lfHtml:
    result.add "<ul>"

    if loremStart:
      result.add "<li>" & wordify(wNum, fishLines[0]).toText & "</li>"
      inc pCount

    while pCount < pNum:
      result.add "<li>" & wordify(wNum).toText & "</li>"
      inc pCount

    result.add "</ul>"

  of lfLine:
    if loremStart:
      result.add wordify(wNum, fishLines[0]).toText & "\n\n"
      inc pCount

    while pCount < pNum:
      result.add wordify(wNum).toText & "\n\n"
      inc pCount

    result.removeSuffix "\n\n"

  of lfNone:
    if loremStart:
      result.add wordify(wNum, fishLines[0]).toText & "\n"
      inc pCount

    while pCount < pNum:
      result.add wordify(wNum).toText & "\n"
      inc pCount

    result.removeSuffix "\n"

proc loremTexts*(pNum: Positive, loremStart = true,
                 lfmt = lfLine): string =
  ## Get `pNum` number of full lorem paragraphs
  ## and `lfmt` formatting. No random in vm.
  ## Starts with "Lorem ipsum..." if `loremStart`.
  var
    rands = randBytes()
    pCount = 0

  case lfmt
  of lfHtml:
    result.add "<ul>"

    if loremStart:
      result.add "<li>" & fishLines[0].toText & "</li>"
      inc pCount

    while pCount < pNum:
      let index = rands[pCount mod llen]
      result.add "<li>" & fishLines[index].toText & "</li>"
      inc pCount

    result.add "</ul>"

  of lfLine:
    if loremStart:
      result.add fishLines[0].toText & "\n\n"
      inc pCount

    while pCount < pNum:
      let index = rands[pCount mod llen]
      result.add fishLines[index].toText & "\n\n"
      inc pCount

    result.removeSuffix "\n\n"

  of lfNone:
    if loremStart:
      result.add fishLines[0].toText & "\n"
      inc pCount

    while pCount < pNum:
      let index = rands[pCount mod llen]
      result.add fishLines[index].toText & "\n"
      inc pCount

    result.removeSuffix "\n"
