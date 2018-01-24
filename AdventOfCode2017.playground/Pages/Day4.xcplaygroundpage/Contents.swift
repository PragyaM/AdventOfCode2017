//: [Previous](@previous)

import Foundation

// ====== HELPER FUNCTIONS ======

func sanitisedInput(_ input: String) -> [[String]] {
    let passphrases = input.components(separatedBy: "\n")
    return passphrases.map { $0.components(separatedBy: " ").flatMap { $0 } }
}

// ====== PART ONE ======
func partOneNumberOfValidPassphrases(in passphrases: [[String]]) -> Int {
    return passphrases.filter { partOneIsPassphraseValid(passphrase: $0) }.count
}

func partOneIsPassphraseValid(passphrase: [String]) -> Bool {
    // passphrase is valid if there if all words in passphrase are unique
    var uniqueWordsSet = Set<String>()
    let uniquenessMapping = passphrase.flatMap { uniqueWordsSet.insert($0).inserted ? true : false }
    return !uniquenessMapping.contains(false)
}

let result = partOneNumberOfValidPassphrases(in: sanitisedInput(Inputs.mainInput))
print("Part one valid passphrases: \(result)")

// ====== PART TWO ======
func partTwoNumberOfValidPassphrases(in passphrases: [[String]]) -> Int {
    return passphrases.filter { partTwoIsPassphraseValid(passphrase: $0) }.count
}

func partTwoIsPassphraseValid(passphrase: [String]) -> Bool {
    // passphrase is valid if there if all words in passphrase are unique and
    // no word is an anagram of another

    let orderedCharsPassphrase = passphrase.map { String($0.sorted()) }
    var uniqueWordsSet = Set<String>()
    let uniquenessMapping = orderedCharsPassphrase.flatMap { uniqueWordsSet.insert($0).inserted ? true : false }

    return !uniquenessMapping.contains(false)
}

let partTwoResult = partTwoNumberOfValidPassphrases(in: sanitisedInput(Inputs.mainInput))
print("Part two valid passphrases: \(partTwoResult)")


//: [Next](@next)

