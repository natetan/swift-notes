// Yulong Tan
// INFO 498 - IOS Development
// Lecture 2: 10.6.16

//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// External labels: everything external needs to use this name
// Internal labels: everything inside can use str instead
func sayHello(thisIsAReallyLongName str: String) -> String {
    return ("Hello, \(str)")
}
sayHello(thisIsAReallyLongName: "Fred")

for _ in 1...5 {
    print("Hello")
}

print("Hello, world")

// Default parameters needed at the end
// Defaults make it so no params are needed with function call
func roll(numberOfDice : UInt = 3, times : UInt = 6, withBonus : UInt = 0) -> [UInt] {
    var results : [UInt] = []
    for _ in 1...times {
        var accum : UInt = 0
        for _ in 1...numberOfDice {
            let dieRoll = UInt(arc4random_uniform(6) + 1)
            accum += dieRoll
        }
        results.append (accum + withBonus)
    }
    
    return results
}
let dieRolls = roll(numberOfDice: 3, times: 6, withBonus: 0)
print(dieRolls)

roll(numberOfDice: 3, times: 7, withBonus: 0)
roll()

// ... allows us to type in any amount of numbers
func adding(_ numbers : UInt...) -> UInt {
    var total : UInt = 0
    for num in numbers {
        total += num
    }
    return total
}

adding(1)
adding(1, 2, 3, 4)
adding()

let addFunc = adding
addFunc(1, 2, 3, 4)

/* Functional Programming example start */

func add(left: Int, right: Int) -> Int {
    return left + right
}

func subtract(left: Int, right: Int) -> Int {
    return left - right
}

func math(left: Int, right: Int, op: (Int, Int) -> Int) -> Int {
    return op(left, right)
}
math(left: 2, right: 2, op: add)
math(left: 2, right: 2, op: subtract)

// Multiply variable is set to anonymous function
let multiply = { (left: Int, right: Int) -> Int in
    return left * right
}

// Anonymous function in the op
math(left: 10, right: 2, op: { (left, right) in return left / right })
math(left: 10, right: 2, op: { (left, right) in left / right })
// $ is argument. $0 is first argument
math(left: 10, right: 2, op: {  $0 / $1 })
math(left: 10, right: 2) { $0 + $1 }

/* Functional Programming example end */

// inout means the parameter can be modified. inout + & allows it to be modified
func doSomething(with: inout Int) {
    // with *= 2 Swift considers the param immutable (treats it as a let)
    print(with)
}

// Without the use of inout, use var
func doSomethingElse(with: inout Int) {
    var with = with
    with *= 2 // works here
    print(with)
}
var x = 5
doSomething(with: &x)
print(x)


// Arrays

var shoppingList : [String] = ["catfish", "water", "tulips", "blue paint"]
shoppingList.append("soda")
print(shoppingList)

// Replace index 1 with h20
shoppingList[1] = "h20"
print(shoppingList)

// Insert
shoppingList.insert("cats", at: 4)

// Filters the array so everything more than 4 characters stays
var short = shoppingList.filter() {
    return $0.lengthOfBytes(using: String.Encoding.ascii) > 4
}

print(short)


// Dictionaries / maps

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]

// Adding Jayne -> Public Relations
occupations["Jayne"] = "Public Relations"
print("Dictionary 1: \(occupations)")
let malJob = occupations["Malcolm"]
print("Mal is the \(malJob)")
print("People work as \(occupations)")

var explore = [ 4.5 : "StringValue" ]
print("Can we key by doubles? \(explore[4.5])")

// Use for-in over dictionaries
for (key, value) in occupations {
    print("\(key) is the \(value)")
}

// Null, Nil

var maybe : Int? = nil
maybe?.bigEndian
// maybe!.bigEndian <-- invokes a method on nil, so it crashes
// ? asks if value is nil

// Tuples

var city = ("Seattle", "Washington", 5000000)
var person = ("Teresa", "Nguyen", 39)
var ssi = city
ssi = person
// Structurally typed!
print(ssi)
print(ssi.0)