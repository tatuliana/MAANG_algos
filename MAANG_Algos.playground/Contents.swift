import Cocoa

/*
Input: array of integers;
Output: array of integers;
If an array has duplicates, remove them and the element itself.
For example:
Input - [1, 2, 5, 7, 1, 1, 3, 2]
Output - [5, 7, 3]
 */

func removeDuplicatedElements(from array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }
    var dict = [Int: Int]()
    var result = [Int]()
    for element in array {
        if dict[element] != nil {
            dict[element] = dict[element]! + 1
        } else {
            dict[element] = 1
        }
    }
    for (key, value) in dict where value == 1 {
        result.append(key)
    }
    return result
}

removeDuplicatedElements(from: [1, 2, 5, 7, 1, 1, 3])
removeDuplicatedElements(from: [1, 2, 5, 7, 1, 1, 3, 2])
removeDuplicatedElements(from: [1])
removeDuplicatedElements(from: [1, 1])
removeDuplicatedElements(from: [])

/*
 Input: array of strings;
 Output: string
 Find the element that has the max number of duplicates
 For example:
 Input - [swan, swan, hummingbird, eagle, swan, eagle];
 Output - swan;
 Additional questions:
 If we have more than one element that have the same maximum number of repetitions. (For example - [swan, eagle, swan, hummingbird, eagle, swan, eagle]) Which element will be returned?
 How can we solve this algorithm without using a dictionary?
 */

func findMaxDuplicate(array: [String]) -> String {
    var dict = [String: Int]()
    var result = ""
    
    for element in array {
        if dict[element] != nil {
            dict[element] = dict[element]! + 1
        } else {
            dict[element] = 1
        }
    }

    for (key, value) in dict.sorted(by: <) where value == dict.values.max() {
        result = key
        break
    }

    return result
}

let strings = ["swan", "swan", "hummingbird", "eagle", "swan", "eagle"]
let result = findMaxDuplicate(array: strings)

let strings1 = ["swan", "eagle", "swan", "hummingbird", "eagle", "swan", "eagle"]
let result1 = findMaxDuplicate(array: strings1)

func findMaxDuplicateBySorting(array: inout [String]) -> String {
    var maxCount = 0
    var currentCount = 1  // Start from 1 because we will count the first occurrence
    var maxString = ""
    var currentString = array[0]

    for i in 1..<array.count {
        if array[i] == currentString {
            currentCount += 1
        } else {
            if currentCount > maxCount {
                maxCount = currentCount
                maxString = currentString
            }
            currentString = array[i]
            currentCount = 1
        }
    }

    // Handle the last set of duplicates
    if currentCount > maxCount {
        maxString = currentString
    }

    return maxString
}

var strings2 = ["swan", "eagle", "swan", "hummingbird", "eagle", "swan", "eagle"]
let result2 = findMaxDuplicateBySorting(array: &strings2)

