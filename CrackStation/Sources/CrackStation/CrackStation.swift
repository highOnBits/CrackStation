import Foundation

public class CrackStation {
    private var hashValuesDict: [String: String] = [:]
    
    public init(){
        do{
            self.hashValuesDict = try loadDictionaryFromDisk()
        } catch {
            print("Unexpecetd Error Occured. Failed to load hash values.")
        }
    }
    
    private func loadDictionaryFromDisk() throws -> [String : String] {
        var jsonResult: Any?
        if let path = Bundle.module.path(forResource: "hashValues", ofType: "json") {
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
    
    public func crack(hash: String) -> String {
        let keyExist = self.hashValuesDict[hash] != nil
        
        if keyExist{
            return self.hashValuesDict[hash]!
        }
        else{
            return "Unable to crack the password! Please make sure you have done the installation correctly and input is valid. For installation steps, please refer README file."
        }
    }
}

