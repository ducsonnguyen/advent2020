import Foundation

var seats: [Int] = []
while let line = readLine() {
    var binaryString = line.replacingOccurrences(of: "F", with: "0")
    binaryString = binaryString.replacingOccurrences(of: "B", with: "1")
    binaryString = binaryString.replacingOccurrences(of: "L", with: "0")
    binaryString = binaryString.replacingOccurrences(of: "R", with: "1")

    guard let seatID = Int(binaryString, radix: 2) else {
        print("Failed to convert \(binaryString)")
        continue
    }

    // save seat ID
    seats.append(seatID)
}

seats.sort()
print("highest seat ID: \(seats[seats.count - 1])")

let allSeats = Array(0...1023)
let unlistedSeats = allSeats.filter() { !seats.contains($0) }
let missingSeats = unlistedSeats.filter() {
    !unlistedSeats.contains($0 - 1) && !unlistedSeats.contains($0 + 1)
}
print("missing seat: \(missingSeats)")
