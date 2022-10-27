import hashlib
import json

def generateHashFile():
    possibleCharAsciis = []
    dictSHA1 = {}
    dictSHA256 = {}

    # create an array of all possible char ascii values.
    for i in range (65, 123):
        if i > 90 and i < 97:
            continue

        possibleCharAsciis.append(i)
    
    for i in range(48,58):
        possibleCharAsciis.append(i)

    for item in possibleCharAsciis:
        char1 = chr(item)
        dictSHA1[generateHashSHA1(char1)] = char1
        dictSHA256[generateHashSHA256(char1)] = char1

        for item2 in possibleCharAsciis:
            char2 = chr(item2)
            dictSHA1[generateHashSHA1(char1 + char2)] = char1 + char2
            dictSHA256[generateHashSHA256(char1 + char2)] = char1 + char2

    writeHashToFile(dictSHA1, "hashValuesSHA1.json")
    writeHashToFile(dictSHA256, "hashValuesSHA256.json")
    
def writeHashToFile(dict, fileName):
    with open('../CrackStation/Sources/CrackStation/' + fileName, 'w') as convert_file:
        convert_file.write(json.dumps(dict))

def generateHashSHA1(str):
    return hashlib.sha1(str.encode()).hexdigest()

def generateHashSHA256(str):
    return hashlib.sha256(str.encode()).hexdigest()


if __name__ == "__main__":
    generateHashFile()

