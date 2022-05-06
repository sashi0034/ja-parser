import std/tables
import one_gram

type OneGramTable = ref Table[string, int]
type OneOfNRaw* = ref seq[int]
type OneOfNMatrix* = ref seq[OneOfNRaw]



            

func lookThroughAndRegisterGram(gramList: GramList, appearedTable: OneGramTable, indexSeq: ref seq[int]) = 
    for i, gram in gramList[]:
        let gramStr: string = gram.getTextDataAsString
        if appearedTable[].hasKey(gramStr)==false:
            let addingIndex = appearedTable[].len
            indexSeq[].add(addingIndex)
            
            appearedTable[][gramStr]=addingIndex
        else:
            indexSeq[].add(appearedTable[][gramStr])


func makeVectorsFromIndexes(indexSeq: ref seq[int], rawSize: int): OneOfNMatrix = 
    result = new(seq[OneOfNRaw])
    
    for indexInNewRaw in indexSeq[]:
        
        var newRaw: OneOfNRaw = new(OneOfNRaw)
        newRaw[] = newSeq[int](rawSize)
        newRaw[indexInNewRaw] = 1
        result[].add(newRaw)


func makeOneOfNVecFromGramList*(gramList: GramList): OneOfNMatrix =
    var appearedSet: OneGramTable = new(OneGramTable)
    var indexSeq: ref seq[int] = new(seq[int])

    lookThroughAndRegisterGram(gramList, appearedSet, indexSeq)
    result = makeVectorsFromIndexes(indexSeq, appearedSet.len)



