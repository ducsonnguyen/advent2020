import Foundation

func checkSlope(map: [String], right: Int, down: Int) -> Int {
    var xPosition = 0
    var yPosition = 0
    var treeCount = 0
    for line in map {
        if yPosition % down != 0 {
            yPosition += 1
            continue
        }

        let map = line.map { String($0) }
        if map[xPosition % map.count] == "#" {
            treeCount += 1
        }

        yPosition += 1
        xPosition += right
    }

    return treeCount
}

let slopes = [
    (1, 1),
    (3, 1),
    (5, 1),
    (7, 1),
    (1, 2),
]

var data: [String] = []
while let line = readLine() {
    data.append(line.trimmingCharacters(in: .whitespacesAndNewlines))
}

var product = 1
for s in slopes {
    let treeCount = checkSlope(map: data, right: s.0, down: s.1)
    print("\(treeCount) trees passed for slope \(s.0), \(s.1)")
    product *= treeCount
}

print("Result: \(product)")