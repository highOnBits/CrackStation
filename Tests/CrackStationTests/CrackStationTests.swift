import XCTest
import CrackStation

final class CrackStationTests: XCTestCase {
    func testCrackStation_canCrackPassowrdAlphabet() {
        // Given
        let crackStation = CrackStation()
        let hashValueToDecrypt = "23eb4d3f4155395a74e9d534f97ff4c1908f5aac" // Hash Value for 'Y'
        
        // When
        let crackedPW = crackStation.decrypt(shaHash: hashValueToDecrypt)
        
        // Then
        XCTAssertEqual(crackedPW, "Y")
    }
    
    func testCrackStation_canCrackPassowrdNumber() {
        // Given
        let crackStation = CrackStation()
        let hashValueToDecrypt = "b6589fc6ab0dc82cf12099d1c2d40ab994e8410c" // Hash Value for '0'
        
        // When
        let crackedPW = crackStation.decrypt(shaHash: hashValueToDecrypt)
        
        // Then
        XCTAssertEqual(crackedPW, "0")
    }
    
    func testCrackStation_canCrackPassowrdAlphabetCombination() {
        // Given
        let crackStation = CrackStation()
        let hashValueToDecrypt = "64a7d3df42044d41148734da59a5718e89126b34" // Hash Value for 'YK'
        
        // When
        let crackedPW = crackStation.decrypt(shaHash: hashValueToDecrypt)
        
        // Then
        XCTAssertEqual(crackedPW, "YK")
    }
    
    func testCrackStation_canCrackPassowrdNumberCombination() {
        // Given
        let crackStation = CrackStation()
        let hashValueToDecrypt = "7719a1c782a1ba91c031a682a0a2f8658209adbf" // Hash Value for '29'
        
        // When
        let crackedPW = crackStation.decrypt(shaHash: hashValueToDecrypt)
        
        // Then
        XCTAssertEqual(crackedPW, "29")
    }
    
    func testCrackStation_invalidInput() {
        // Given
        let crackStation = CrackStation()
        let hashValueToDecrypt = "71ac9eed6a76a285ae035fe84a251d56ae9485a4" // Hash Value for "tails"
        
        // When
        let crackedPW = crackStation.decrypt(shaHash: hashValueToDecrypt)
        
        // Then
        XCTAssertEqual(crackedPW, nil)
    }
    
    func testCrackStation_emptyInput() {
        // Given
        let crackStation = CrackStation()
        let hashValueToDecrypt = ""
        
        // When
        let crackedPW = crackStation.decrypt(shaHash: hashValueToDecrypt)
        
        // Then
        XCTAssertEqual(crackedPW, nil)
    }
    
    func testCrackStation_threeCharactersCombinations_sha1() {
        let crackStation = CrackStation()
        let hashValueToDecrypt = "c225ebaf44426ff4b948536e095f9db2b6d91bda" // Hash Value for 'A3!'
        
        // When
        let crackedPW = crackStation.decrypt(shaHash: hashValueToDecrypt)
        
        // Then
        XCTAssertEqual(crackedPW, "A3!")
    }
    
    func testCrackStation_threeCharactersCombinations_sh1() {
        let crackStation = CrackStation()
        let hashValueToDecrypt = "56073cbd03491e7b2588c7c1fcc9e55b6374ebb5" // Hash Value for '?aZ'
        
        // When
        let crackedPW = crackStation.decrypt(shaHash: hashValueToDecrypt)
        
        // Then
        XCTAssertEqual(crackedPW, "?aZ")
    }
    
    func testCrackStation_threeCharactersCombinations_sha256() {
        let crackStation = CrackStation()
        let hashValueToDecrypt = "dbf9b6564530bf7e0096dfd806e121dd645c0bb1d7d063f5f0e39d096601aee6" // Hash Value for 'A3!'
        
        // When
        let crackedPW = crackStation.decrypt(shaHash: hashValueToDecrypt)
        
        // Then
        XCTAssertEqual(crackedPW, "A3!")
    }
    
    func testCrackStation_threeCharactersCombinations_sh256() {
        let crackStation = CrackStation()
        let hashValueToDecrypt = "6e8528bad036695a9fac1112780cb11d2664d4bc882652e833cd026a5e84f164" // Hash Value for '?aZ'
        
        // When
        let crackedPW = crackStation.decrypt(shaHash: hashValueToDecrypt)
        
        // Then
        XCTAssertEqual(crackedPW, "?aZ")
    }
    
    func testCrackStation_invalid_fiveCharactersCombinations() {
        let crackStation = CrackStation()
        let hashValueToDecrypt = "7b5473255b1b3fef37b80be3c87270a856897211bd56d0798e919087b793cc14" // Hash Value for '?aZq!'
        
        // When
        let crackedPW = crackStation.decrypt(shaHash: hashValueToDecrypt)
        
        // Then
        XCTAssertEqual(crackedPW, nil)
    }
}
