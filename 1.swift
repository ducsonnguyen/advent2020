import Foundation

var numbers: [Int] = []
while let line = readLine() {
    if let num = Int(line.trimmingCharacters(in: .whitespacesAndNewlines)) {
       numbers.append(num)
    }
}

for x in numbers {
    let search = 2020 - x
    // TODO: sorted array; binary search
    if numbers.contains(search) {
        print("\(x) * \(search) = \(x * search)")
        exit(0)
    }
}

// Nothing was found
exit(1)