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
    
    func testCrackStation_invalidInput() {
        // Given
        let crackStation = CrackStation()
        let hashValueToDecrypt = "23eb4d3f4155395a74e9d534f97ff4c1908f5asc" // Hash Value for 'Y'
        // let stringToBeReturned = "Unable to crack the password! Please make sure you have done the installation correctly and input is valid. For installation steps, please refer README file."
        
        // When
        let crackedPW = crackStation.decrypt(shaHash: hashValueToDecrypt)
        
        // Then
        XCTAssertEqual(crackedPW, nil)
    }
}
