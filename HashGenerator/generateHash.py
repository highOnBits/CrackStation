import hashlib
import json

def generateHashFile():
    dict = {}
    for i in range(65, 123):
        if i > 90 and i < 97: 
            continue

        char = chr(i)
        hashValue = generateHash(char)
        dict[hashValue] = char

    for i in range(48, 58):
        char = chr(i)
        hashValue = generateHash(char)
        dict[hashValue] = char

    writeHashToFile(dict)
    
def writeHashToFile(dict):
    with open('../CrackStation/Sources/CrackStation/hashValues.json', 'w') as convert_file:
     convert_file.write(json.dumps(dict))

def generateHash(str):
    return hashlib.sha1(str.encode()).hexdigest()


if __name__ == "__main__":
    generateHashFile()

