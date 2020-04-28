

import Foundation
  import HealthKit
  
import Compression
import PlaygroundSupport

let fileURL = Bundle.main.url(forResource: "crfsample", withExtension: "json")
let content = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)

let algorithm = COMPRESSION_ZLIB
       var sourceBuffer = Array(content.utf8)
       let destinationBuffer = UnsafeMutablePointer<UInt8>.allocate(capacity: sourceBuffer.count)
       
       let compressedSize = compression_encode_buffer(destinationBuffer, sourceBuffer.count,
                                                      &sourceBuffer, sourceBuffer.count,
                                                      nil,
                                                      algorithm)

let compressedData = Data(bytes: destinationBuffer,
                                 count: compressedSize)
var data = compressedData.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))

//let fileURL2 = Bundle.main.url(forResource: "a", withExtension: "txt")
let fileURL2 = playgroundSharedDataDirectory.appendingPathComponent("a.txt")
do {
    try data.write(to: fileURL2, atomically: true, encoding: .utf8)
} catch {
    print(error)
}

NSNumber.init(booleanLiteral: true)



  extension Array where Element: Hashable {
  func difference(from other: [Element]) -> [Element] {
      let thisSet = Set(self)
      let otherSet = Set(other)
      return Array(thisSet.symmetricDifference(otherSet))
  } }
  
  var arr1 = [1,2,3,4,5,6,7,8]
  var arr2 = [1,2,3,4,5,]

  var arrdiff = arr2.difference(from: arr1)
  
  var hk = HKUnit.pound().unitString

  
  let calendar = Calendar.current
  
  var interval = DateComponents()
  
  
  var anchorComponents = calendar.dateComponents([.day, .month, .year, .weekday], from: Date())
  anchorComponents.hour = 0
  anchorComponents.minute = 0
  anchorComponents.second = 0
  
  var offset = (7 + anchorComponents.weekday! - 1) % 7
  anchorComponents.day = anchorComponents.day! - offset

  var startDate = calendar.date(from: anchorComponents)!
  
  
  anchorComponents.hour = 23
  anchorComponents.minute = 59
  anchorComponents.second = 59
  
  anchorComponents.day = anchorComponents.day! + 6 as Int
  
  var endofWeek = calendar.date(from: anchorComponents)!
  
