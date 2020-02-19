//: [Previous](@previous)

import Foundation

let input = [10, 3, 15, 10, 5, 15, 5, 15, 9, 2, 5, 8, 5, 2, 3, 6]

let sampleInputPartOne = [0, 2, 7, 0] // 

let sampleInputPartTwo = [Int]()

// ====== HELPER FUNCTIONS ======

func banksFromArray(input: [Int]) -> [Int : Int] {
    var banks = [Int : Int]()
    input.indices.map { banks[$0 + 1] = input[$0] } // bank keys start from 1

    return banks
}

// ====== PART ONE ======
func findRepeatCycle(in banks: [Int:Int]) -> Int {
    let initialState = banks
//    let currentState = [Int:Int]()

    // find first element with highest value to start the cycle from
    let sortedBanks = banks.sorted { (bank1, bank2) -> Bool in
        bank1.value > bank2.value
    }
    let startIndex = sortedBanks.first?.key ?? 0
//    var cycleCount = 0

    cycle(banks: initialState, startIndex: startIndex)
//    while initialState != currentState {
//        cycle(banks: currentState)
//    }

    return 0
}

func cycle(banks: [Int:Int], startIndex: Int) -> [Int:Int] {

    print("start index: \(startIndex)")
    var cycledBanks = banks

    // get number of blocks in bank at start index
    let blocksToDistribute = banks[startIndex] ?? 0
    print("blocks to distribute: \(blocksToDistribute)")

    cycledBanks[startIndex] = 0
    var currentIndex = startIndex + 1

    for _ in (0..<blocksToDistribute) {
        print(cycledBanks)
        if currentIndex >= cycledBanks.count {
            currentIndex = 0
        }
        cycledBanks[currentIndex] = (cycledBanks[currentIndex] ?? 0) + 1
        currentIndex = currentIndex + 1
    }

    return banks
}

func partOneRepeatCycle(input: [Int]) -> Int {
    let banks = banksFromArray(input: input)
    return findRepeatCycle(in: banks)
}

print("Part one cycle: \(partOneRepeatCycle(input: sampleInputPartOne))")

//// ====== PART TWO ======
//func partTwoChecksum(input: String) -> Int {
//    let rows = sanitisedInput(input)
//    let rowDivisions = rows.flatMap { row in evenDivisionResult(in: row) }
//
//    return rowDivisions.reduce(0, +)
//}
//
//print("Part two checksum: \(partTwoChecksum(input: inputStr))")


//: [Next](@next)

