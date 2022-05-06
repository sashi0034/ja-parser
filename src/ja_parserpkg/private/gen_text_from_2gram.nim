
import unicode
import one_gram
import one_of_n
import random


proc findNextWordRawIndex(oneOfNMat: OneOfNMatrix, dimIndex: int): int = 
    let rawMax = oneOfNMat[].len
    let loopMax = rawMax * 2

    for _ in 1..loopMax:
        let randIndex = rand(max(rawMax-1-1, 0))

        if oneOfNMat[][randIndex][][dimIndex]!=0:
            return randIndex+1

    return -1


func findNonZeroIndexInRaw(oneOfNMat: OneOfNMatrix, rawIndex: int): int =
    let rawMax = oneOfNMat[].len
    for i in 0..rawMax-1:
        if oneOfNMat[][rawIndex][][i] != 0:
            return i
    



proc generateTextFrom2Gram*(oneOfNMat: OneOfNMatrix, gramList: GramList, startDimIndex: int, maxCount: int): string =
    let collumMax: int = oneOfNMat[][0][].len
    randomize()

    result = ""
    var curDimIndex = startDimIndex

    for _ in 1..maxCount:
        let nextIndex = findNextWordRawIndex(oneOfNMat, curDimIndex)
        if nextIndex != -1:
            result &= gramList[][nextIndex].getTextDataAsString
            curDimIndex = findNonZeroIndexInRaw(oneOfNMat, nextIndex)
        else:
            curDimIndex = rand(collumMax-1)









