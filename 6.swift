import Foundation

var questionsAnswered = Set<Character>()
var count = 0
var groups = 0
while let line = readLine() {
    if line.isEmpty {
        groups += 1
        count += questionsAnswered.count
        questionsAnswered = Set<Character>()
        continue
    }
    
    for char in String(line).trimmingCharacters(in: .whitespacesAndNewlines) {
        questionsAnswered.insert(char)
    }
}

print("Total count: \(count)")
