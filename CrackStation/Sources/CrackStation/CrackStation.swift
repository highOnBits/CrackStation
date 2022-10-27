import Foundation

public protocol Decrypter {
    init()

    /// Either returns the cracked plain-text password
    /// or, if unable to crack, then returns nil.
    /// - Parameter shaHash: The SHA-1 or SHA-256 digest that corresponds to the encrypted password.
    /// - Returns: The underlying plain-text password if `shaHash` was successfully cracked. Otherwise returns nil.
    func decrypt(shaHash: String) -> String?
}

public class CrackStation : Decrypter {
    private var hashValuesDictSHA1: [String: String] = [:]
    private var hashValuesDictSHA256: [String: String] = [:]

    public required init(){
        do{
            self.hashValuesDictSHA1 = try loadDictionaryFromDisk(fileName: "hashValuesSHA1")
            self.hashValuesDictSHA256 = try loadDictionaryFromDisk(fileName: "hashValuesSHA256")
        } catch {
            print("Unexpecetd Error Occured. Failed to load hash values.")
        }
    }
    
    // Loads the dictionary from a json file present in the disc.
    // Throws error if fail to load dictionary from json file in the disc.
    private func loadDictionaryFromDisk(fileName: String) throws -> [String : String] {
        var jsonResult: Any?
        if let path = Bundle.module.path(forResource: fileName, ofType: "json") {
            do{
                let fileUrl = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                jsonResult = try JSONSerialization.jsonObject(with: data)
            } catch {
                return [:]
            }
        }
        
        if let lookupTable: Dictionary = jsonResult as? Dictionary<String, String> {
            return lookupTable
        } else {
            return [:]
        }
    }
    
    // Cracks the encrypted password encrypted using SHA-1 and matches the regex [A-Za-z0-9]
    // Input -> Takes the Encrypted password, Output -> Returns the decrypted character for the password
    public func decrypt(shaHash: String) -> String? {
        let keyExistInSHA1 = self.hashValuesDictSHA1[shaHash] != nil
        let keyExistInSHA256 = self.hashValuesDictSHA256[shaHash] != nil
        
        if keyExistInSHA1{
            return self.hashValuesDictSHA1[shaHash]!
        }
        if keyExistInSHA256{
            return self.hashValuesDictSHA256[shaHash]!
        }
        
        return nil
    }
}

