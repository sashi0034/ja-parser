import docopt
import ja_parserpkg/main
import ../util/debug

# get nimble's values
include nimble_config
include ../ja_parser.nimble

let doc = """
ja_parser.

Usage:
  ja_parser [--sample=<sample>] <filename>
  ja_parser (-h | --help)
  ja_parser (-v | --version)

Options:
  --sample=<sample>  sample option[default: abcdefg].
  -h --help          Show this screen.
  -v --version       Show version.
"""

proc start(): int =
  let args = docopt(doc, version = "ja_parser " & version)
  debug args
  result = main(args)

# 引数チェック
when isMainModule:
  quit(start())
