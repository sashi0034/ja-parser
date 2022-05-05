
import unicode

type TextQue* = ref object
    bufferSize: int
    textData: seq[Rune]


func createSpaceString(size: int): string = 
    return (var s=""; for i in 1..size: s = s & " "; s)


func newTextQue*(bufferSize: int): TextQue =
    let spaceStr: string = createSpaceString(bufferSize)
    return TextQue(bufferSize: bufferSize, textData: spaceStr.toRunes)

    
func getTextDataAsString*(self: TextQue): string = 
    let data = self.textData
    return $data



