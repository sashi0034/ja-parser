
import system
import text_que
import unicode
import one_gram
import gram_que
import one_of_n
import gen_text_from_2gram


proc startProcess*(fileName: string) =
    const parseSize = 2
    let inputText: seq[Rune] = readFile(fileName).toRunes

    # var que = newTextQue(parseSize)
    
    # for i in countup(0, inputText.len-1):
    #     que.push(inputText[i])
    #     echo que.getTextDataAsString
    
    let gramList = one_gram.splitTextIntoOneGrams(inputText)

    # var gramQue = createGramQue(parseSize)

    # for i, gram in gramList[]:
    #     gramQue.push(gram)
    #     if i>=2: gramQue.writeQue
        
    let mat: OneOfNMatrix = makeOneOfNMatFromGramList(gramList)

    # for raw in vec[]:
    #     echo $raw[]

    let generatedStr = generateTextFrom2Gram(mat, gramList, 0, 256)
    echo generatedStr

