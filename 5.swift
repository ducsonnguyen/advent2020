import Foundation

func partition(code: String, range: (lower: Int, upper: Int)) -> (Int, Int) {
    var newRange = range
    for c in code {
        switch c {
        case "F", "L":
            let newUpper = Int(floor(Double(newRange.upper + newRange.lower) / 2.0))
            newRange = (newRange.lower, newUpper)
        case "B", "R":
            newRange = (Int(ceil(Double(newRange.upper + newRange.lower) / 2.0)), newRange.upper)
        default:
            fatalError("Unhandled code")
        }
    }

    return newRange
}

var seats: [Int] = []
while let line = readLine() {
    let columnStart = line.index(line.startIndex, offsetBy: 7)

    // first 7
    let rowCode = String(line[..<columnStart])

    // last 3
    let colCode = String(line[columnStart...])

    let row = partition(code: rowCode, range: (0, 127))
    let column = partition(code: colCode, range: (0, 7))
//    print("\(line): \(row), \(column)")

    // save seat ID
    seats.append(row.0 * 8 + column.0)
}

seats.sort()
print("highest seat ID: \(seats[seats.count - 1])")

let allSeats = Array(0...1023)
let unlistedSeats = allSeats.filter() { !seats.contains($0) }
let missingSeats = unlistedSeats.filter() {
    !unlistedSeats.contains($0 - 1) && !unlistedSeats.contains($0 + 1)
}
print("missing seat: \(missingSeats)")
