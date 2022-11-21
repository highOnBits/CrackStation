import Foundation

public protocol Decrypter {
    init()

    /// Either returns the cracked plain-text password
    /// or, if unable to crack, then returns nil.
    /// - Parameter shaHash: The SHA-1 or SHA-256 digest that corresponds to the encrypted password.
    /// - Returns: The underlying plain-text password if `shaHash` was successfully cracked. Otherwise returns nil.
    func decrypt(shaHash: String) -> String?
}

/// This class handles the decryption a given password upto 3 characters long encrypted using SHA1 or SHA256
public class CrackStation : Decrypter {
    private let hashValuesDictSHA1: [String: String]
    private let hashValuesDictSHA256: [String: String]

    public required init(){
        do{
            self.hashValuesDictSHA1 = try Self.loadDictionaryFromDisk(fileName: "hashValuesSHA1")
        } catch {
            self.hashValuesDictSHA1 = [:]
            assertionFailure("Failed to load the SHA1 hash values while initializing CrackStation.")
        }
        do {
            self.hashValuesDictSHA256 = try Self.loadDictionaryFromDisk(fileName: "hashValuesSHA256")
        } catch {
            self.hashValuesDictSHA256 = [:]
            assertionFailure("Failed to load the SHA256 hash values while initializing CrackStation.")
        }
    }
    
    /// Loads the dictionary from a json file present in the disc.
    private static func loadDictionaryFromDisk(fileName: String) throws -> [String : String] {
        guard let path = Bundle.module.url(forResource: fileName, withExtension: "json") else { return [:] }
        
        let data = try Data(contentsOf: path)
        let jsonResult = try JSONSerialization.jsonObject(with: data)
    
        if let lookupTable: Dictionary = jsonResult as? Dictionary<String, String> {
            return lookupTable
        } else {
            return [:]
        }
    }
    
    /// Cracks the encrypted password which is encrypted using SHA-1 and SHA-256 and matches the regex [A-Za-z0-9][A-Za-z0-9]
    /// - Parameter shaHash: The SHA-1 or SHA-256 digest that corresponds to the encrypted password.
    /// - Returns: The underlying plain-text password if `shaHash` was successfully cracked. Otherwise returns nil.
    public func decrypt(shaHash: String) -> String? {
        guard !shaHash.isEmpty, shaHash.count > 3 else {
            return nil
        }
        
        let password = hashValuesDictSHA1[shaHash] ?? hashValuesDictSHA256[shaHash]
        return password
    }
}

