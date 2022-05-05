
import system
import private/main_impl
import private/text_que
import docopt
import strutils, pegs, unicode
import unicode


proc main*(args: Table[string, Value]): int =
    result = 0
    let name = $args["<filename>"]
    echo main_impl.say_hello_to(name)

    let count: int = len(name.toRunes)
    let countStr: string = intToStr(count)
    echo("文字数は" & countStr)
    echo(name.toRunes[3])

    let input: string = readLine(stdin)
    stdout.writeLine("inputed: " & input)
  





