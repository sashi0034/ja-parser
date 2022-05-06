
import system
import text_que
import unicode
import one_gram
import gram_que


proc startProcess*(fileName: string) =
    const parseSize = 2
    let inputText: seq[Rune] = readFile(fileName).toRunes

    # var que = newTextQue(parseSize)
    
    # for i in countup(0, inputText.len-1):
    #     que.push(inputText[i])
    #     echo que.getTextDataAsString
    
    let gramList = one_gram.splitTextIntoOneGrams(inputText)

    var gramQue = createGramQue(parseSize)

    for gram in gramList[]:
        gramQue.push(gram)
        gramQue.writeQue
        
    



