//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let name: String? = "Harry Kane"

//if let
if let testName = name
{
    print(testName)
}else
{
    print("nil returned in optional")
}

//guard let
func testNameFunction(nameArg: String?)
{
guard let anotherTestName = nameArg else{
    print("nil returned in optional")
    return}
    print(anotherTestName)
}

//guard else
func guardElseTestFunction(nameArg: String?)
{
    guard var nameChecker = nameArg else{
        print("nil returned again")
        return
    }
    print(nameChecker)
    //in guard let we can't change the variable defined in the guard. But in regular guard else, we can.
    nameChecker = "Emma Watson"
    print(nameChecker)
}
guardElseTestFunction(nameArg: "Delle Alli")
