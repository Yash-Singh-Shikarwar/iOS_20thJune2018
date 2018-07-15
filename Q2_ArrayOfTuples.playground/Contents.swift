//: Playground - noun: a place where people can play

import UIKit

//Q2 A create an array of tuples that contain a String, Int and Double. Using a for in loop, iterate through this array and print out each of the tuple elements separated by the string:  “~>”

var arrOfTuples: [(name: String, firstNum: Int, secondNum: Double)] = []
arrOfTuples.append((name: "Rickon", firstNum: 10, secondNum: 4.4))
arrOfTuples.append((name: "Jojen", firstNum: 12, secondNum: 5.87))
arrOfTuples.append((name: "Talisa", firstNum: 26, secondNum: 1.09))
arrOfTuples.append((name: "The Waif", firstNum: 25, secondNum: 5.98))


for index in arrOfTuples {
    print("\(index.name) ~> \(index.firstNum) ~> \(index.secondNum)")
}
