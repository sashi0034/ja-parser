import system
import unicode

type OneGram* = ref object
    textData: ref seq[Rune]

type GramList* = ref seq[OneGram]

type ELetter = enum 
    None
    Kanji
    Katakana
    Hiragana
    Punctuation
    Space
    Others

func createOneGram*(text: ref seq[Rune]): OneGram =
    return OneGram(textData: text)

func getTextData*(self: OneGram): ref seq[Rune] =
    return self.textData

func getTextDataAsString*(self: OneGram): string =
    return $self.textData[]

func utf8ToUcs4(letter: string): uint32 = 
    const base: array[7, uint32] = [
        cast[uint32](0x00000000), 
        cast[uint32](0x00000000), 
        cast[uint32](0x00003080), 
        cast[uint32](0x000E2080),
        cast[uint32](0x03C82080), 
        cast[uint32](0xFA082080), 
        cast[uint32](0x82082080)]
    
    let size = letter.len
    let topChar: uint32 = cast[uint32](letter[0])

    if size==1 and topChar < 0x80:
        return topChar

    var charValue = topChar
    for i in countup(1, size-1):
        charValue = (charValue shl 6) + cast[uint8](letter[i])        
    
    result = charValue - base[size]


func chaeckLetterType(letter: string): ELetter =
    let code: uint32 = letter.utf8ToUcs4

    case code
    of 0x3040..0x309f:
        return ELetter.Hiragana
    of 0x30a0..0x30ff:
        return ELetter.Katakana
    of 0x4e00..0x9fff:
        return ELetter.Kanji
    of 0x3001..0x3002, 0xff0c..0xff0e, 0x002c, 0x002e:
        return ELetter.Punctuation
    of 0x0020, 0x3000:
        return ELetter.Space
    else:
        return ELetter.Others


func splitTextIntoOneGrams*(inputText: seq[Rune]): GramList =
    result = new seq[OneGram]
    result[] = @[]

    var tempQue: ref seq[Rune] = new seq[Rune]
    var tempType: ELetter = ELetter.None

    for i, nextLetter in inputText:
        let nextType = chaeckLetterType(nextLetter.toUTF8)

        #debugEcho("", $nextLetter & " ,  " &  $nextType )

        if nextType==tempType:
            tempQue[].add(nextLetter)
        else:
            if tempType!=ELetter.Space:
                result[].add(OneGram(textData: tempQue))

            tempQue = new seq[Rune]
            tempQue[].add(nextLetter)
            tempType = nextType
            
    result[].add(OneGram(textData: tempQue))


