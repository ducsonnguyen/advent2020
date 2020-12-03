import Foundation

var passingCount = 0
while let line = readLine() {
    let things = line.components(separatedBy: ": ")
    let rule = things[0].components(separatedBy: " ")
    let range = rule[0].components(separatedBy: "-").map { Int($0)! }
    let requiredChar = rule[1]
    let password = things[1]

    let requiredCharCount = password.map { String($0) }.filter { $0 == requiredChar }.count
    print("\(requiredCharCount) '\(requiredChar)' found in \(password)")
    if requiredCharCount >= range[0] && requiredCharCount <= range[1] {
        passingCount += 1
    }
}

print("\(passingCount) passwords passed")