//: Playground - noun: a place where people can play

import Foundation

precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ^^ : PowerPrecedence
func ^^ (radix: Int, power: Int) -> Int {
    return Int(pow(Double(radix), Double(power)))
}

func squareSize(atRadius radius: Int) -> Int {
    return radius * 2 + 1
}

func numberOfElementsAtRadius(_ radius: Int) -> Int {
    return radius * 8
}

func maxNumberAtRadius(_ radius: Int) -> Int {
    // also known to always be the bottom right number in a square
    return (radius * 2)^^2 + 1
}

func radius(from number: Int) -> Int {
    // number of squares out from the centre of the spiral
    return Int(Float(number).squareRoot().rounded(.up) / 2.0)
}

func circumferencePositionFromBottomRightAndAntiClockwise(number: Int) -> Int {
    let rad = radius(from: number)
    let size = squareSize(atRadius: rad)
    let diff = maxNumberAtRadius(rad) - number
    let circumfPos : Int

    if diff >= size {
        circumfPos = diff % (size - 1)
    } else {
        circumfPos = diff
    }

    return circumfPos
}

func manhattanDistanceFromCentre(number: Int) -> Int {
    let circumfPos = circumferencePositionFromBottomRightAndAntiClockwise(number: number)
    let rad = radius(from: number)
    let size = squareSize(atRadius: rad)

    let varianceFromCentreAxis = abs((size - 1)/2 - circumfPos)

    return varianceFromCentreAxis + rad
}

let number = 347991
print("number: \(number), manhattan distance from centre: \(manhattanDistanceFromCentre(number: number))")

//====== PART TWO ======
let spiral = """
147  142  133  122   59
304    5    4    2   57
330   10    1    1   54
351   11   23   25   26
362  747  806  854  905
"""

func partTwoFirstValueGreaterThanInput(number: Int) -> Int {
    return 0
}



