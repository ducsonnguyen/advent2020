import Foundation

func check1(range: [Int], requiredChar: String, password: String) -> Bool {
    let requiredCharCount = password.map { String($0) }.filter { $0 == requiredChar }.count
    return requiredCharCount >= range[0] && requiredCharCount <= range[1]
}

func check2(range: [Int], requiredChar: String, password: String) -> Bool {
    let passwordArray = password.map { String($0) }
    return (passwordArray[range[0] - 1] == requiredChar) != (passwordArray[range[1] - 1] == requiredChar)
}

var passingCount1 = 0
var passingCount2 = 0
while let line = readLine() {
    let things = line.components(separatedBy: ": ")
    let rule = things[0].components(separatedBy: " ")
    let range = rule[0].components(separatedBy: "-").map { Int($0)! }
    let requiredChar = rule[1]
    let password = things[1]

    if check1(range: range, requiredChar: requiredChar, password: password) {
        passingCount1 += 1
    }
    if check2(range: range, requiredChar: requiredChar, password: password) {
        passingCount2 += 1
    }
}

print("Part 1: \(passingCount1) passwords passed")
print("Part 2: \(passingCount2) passwords passed")
