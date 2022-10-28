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
}
