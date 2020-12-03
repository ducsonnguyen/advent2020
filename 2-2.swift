import Foundation

var passingCount = 0
while let line = readLine() {
    let things = line.components(separatedBy: ": ")
    let rule = things[0].components(separatedBy: " ")
    let range = rule[0].components(separatedBy: "-").map { Int($0)! }
    let requiredChar = rule[1]
    let passwordArray = things[1].map { String($0) }

    if (passwordArray[range[0] - 1] == requiredChar) != (passwordArray[range[1] - 1] == requiredChar) {
        passingCount += 1
    }
}

print("\(passingCount) passwords passed")