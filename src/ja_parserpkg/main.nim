
import system
import private/process
import docopt


proc main*(args: Table[string, Value]): int =
    result = 0
    let filename = $args["<filename>"]

    startProcess()
    




