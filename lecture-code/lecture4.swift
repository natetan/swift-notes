// Yulong Tan
// INFO 498 - IOS Development
// Lecture 4: 10.13.16

//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// Generics

// These below are identical code (BAD)
// They swap ints, doubles, and strings, but the code is redundant

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}

// Type parameter - <T> is generic so any type can come in here

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var first = "Yulong"
var last = "Tan"
print("\(first), \(last)")
swap(&first, &last)
print("\(first), \(last)")

// IntStack - only takes in ints
struct IntStack {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

// Generic Stack

struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}
print()
print("Testing Stack<Generic>")
var stack = Stack<String>()
stack.push("Hello")
stack.push("my")
stack.push("name")
stack.push("is")
stack.push("Yulong")
for s in stack.items {
    print(s)
}

// Protocols - Similar to interface in Java

protocol Ageable {
    var age : Int {
        get set
    }
}

protocol Nameable {
    func fullName() -> String
}

protocol Birthdayable : Nameable, Ageable {}

class Person : Ageable, Nameable, Birthdayable {
    var age : Int
    var firstName : String
    var lastName : String
    
    init(firstName: String, lastName: String, age : Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
    
    func fullName() -> String {
        return firstName + " " + lastName
    }
}

class Pet : Ageable, Nameable, Birthdayable {
    var name : String
    var age : Int
    
    init(name : String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func fullName() -> String {
        return name
    }
}

func getOlder(_ thing : Birthdayable) {
    var olderThing = thing
    print("Happy Birthday, \(thing.fullName())!")
    olderThing.age += 1
}

var me = Person(firstName: "Yulong", lastName: "Tan", age: 20)
var pet = Pet(name: "Scufzy", age: 2)

getOlder(me)
getOlder(pet)

// Extensions - adding these extensions to the Double type
// You can extend anything, whether you wrote it or not

extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}
print("3ft equals \(3.ft) meters") // 3ft equals 0.914399970739201 meters
var distance = 1.km + 250.m + 5210.ft
print(distance) // 2838.00794918375

// Extension on the Int type + function

extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

// Prints hello 3 times
3.repetitions {
    print("Hello!")
}

// lmao, Java programmers are gonna ask, 'how the hell are you invoking a method from a primitive