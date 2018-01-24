//: [Previous](@previous)

import Foundation

func nextIndexToJumpTo(fromIndex index: Int, inList list: [Int]) -> Int {
    let jumpAmount = list[index]
    return index + jumpAmount
}

// ====== PART ONE ======
func partOneNumberOfStepsToExit(input: [Int]) -> Int {
    var stepCount = 0
    var currentIndex = 0
    var nextIndex = 0
    var list = input

    while (currentIndex >= 0 && currentIndex < list.count) {
        nextIndex = nextIndexToJumpTo(fromIndex: currentIndex, inList: list)
        list[currentIndex] = list[currentIndex] + 1
        currentIndex = nextIndex

        stepCount = stepCount + 1
    }
    return stepCount
}

//print("Part one number of steps to exit: \(partOneNumberOfStepsToExit(input: Inputs.mainInput()))")

// ====== PART TWO ======
func partTwoNumberOfStepsToExit(input: [Int]) -> Int {
    var stepCount = 0
    var currentIndex = 0
    var nextIndex = 0
    var list = input

    while (currentIndex >= 0 && currentIndex < list.count) {
        nextIndex = nextIndexToJumpTo(fromIndex: currentIndex, inList: list)
        if list[currentIndex] >= 3 {
            list[currentIndex] = list[currentIndex] - 1
        } else {
            list[currentIndex] = list[currentIndex] + 1
        }
        currentIndex = nextIndex

        stepCount = stepCount + 1
    }
    return stepCount
}

//print("Part two number of steps to exit: \(partTwoNumberOfStepsToExit(input: Inputs.mainInput()))")

//: [Next](@next)
