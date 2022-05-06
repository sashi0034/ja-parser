import unicode
import one_gram



type GramQue* = ref object
    bufferSize: int
    gramList: GramList


func createEmptyGramSeq(size: int): GramList =
    let ret: GramList = new seq[OneGram]
    for i in 1..size:
        ret[].add(createOneGram(new seq[Rune]))
    return ret


func createGramQue*(bufferSize: int): GramQue =
    let list = createEmptyGramSeq(bufferSize)
    return GramQue(bufferSize: bufferSize, gramList: list)


func get*(self: GramQue, index: int): OneGram = 
    let list = self.gramList
    return list[index]


proc writeQue*(self: GramQue) = 
    var wrightingStr: string = ""
    
    let maxInLoop = self.bufferSize-1
    for i in countup(0, maxInLoop):
        let gram = self.get(i)
        wrightingStr &= gram.getTextDataAsString
        if i < maxInLoop:
            wrightingStr &= " -> "
    
    stdout.writeLine(wrightingStr)




func push*(self: GramQue, element: OneGram) = 
    self.gramList[].add(element)
    self.gramList[].delete(0)


