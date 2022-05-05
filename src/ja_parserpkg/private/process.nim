
import system
import text_que
import unicode


proc startProcess*() =
    const parseSize = 3
    let inputText: seq[Rune] = readLine(stdin).toRunes

    var que = newTextQue(parseSize)
    
    for i in countup(0, inputText.len-1):
        que.push(inputText[i])
        echo que.getTextDataAsString
    
    
    



