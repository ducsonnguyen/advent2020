import Foundation

var xPosition = 0
var treeCount = 0
while let line = readLine() {
    let map = line.trimmingCharacters(in: .whitespacesAndNewlines).map { String($0) }
    if map[xPosition % map.count] == "#" {
        treeCount += 1
    }
    xPosition += 3
}

print("\(treeCount) trees passed")