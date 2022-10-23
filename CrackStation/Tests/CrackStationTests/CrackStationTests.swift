import XCTest
import CrackStation

final class CrackStationTests: XCTestCase {
    func testCrackStation_canCrackPassowrd() {
        // Given
        let crackStation = CrackStation()
        let hashValueToDecrypt = "23eb4d3f4155395a74e9d534f97ff4c1908f5aac" // Hash Value for 'Y'
        
        // When
        let crackedPW = crackStation.crack(hash: hashValueToDecrypt)
        
        // Then
        XCTAssertEqual(crackedPW, "Y")
    }
    
    func testCrackStation_invalidInput() {
        // Given
        let crackStation = CrackStation()
        let hashValueToDecrypt = "23eb4d3f4155395a74e9d534f97ff4c1908f5asc" // Hash Value for 'Y'
        let stringToBeReturned = "Unable to crack the password! Please make sure you have done the installation correctly and input is valid. For installation steps, please refer README file."
        
        // When
        let crackedPW = crackStation.crack(hash: hashValueToDecrypt)
        
        // Then
        XCTAssertEqual(crackedPW, stringToBeReturned)
    }
}
