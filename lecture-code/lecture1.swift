//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// this is a comment

// semicolons are optional

var age = 14

// Most of the time, it is optional to declare the types
var testBool: Bool = true;       // yes
var testBoolFalse: Bool = false; // no
var smallInt: Int8 = 125;
var floatTest: Float = 0.1;
var doubleTest: Double = 0.1;

var testString = "123 and some other stuff";
var character: Character = "A";

var moduloTest = 6 % 7;
// ++ was deprecated in Swift 3.0, so we must use +=
moduloTest += 1;
moduloTest -= 5 + 2 / 3

// let does not allow you to mutate it
let name = "Yulong"

// Optional means the value can be nil

var opt: String?; // output is nil
opt?.append("a"); // can append anything to a nil

// Properly unwrap a nil
// ! means unwrapping an optional and converts it to the type it is

if (opt != nil) {
    print(opt!);
}

// Casting so these 2 can add bc they are of same type
var sum = floatTest + Float(doubleTest);

let interpolatedString = "My name is \(name)." // My name is Yulong
let interpolatedString2 = "My name is " + name + "."; // My name is Yulong

if testBool {
    print("test bool was true without parens");
} else if (1 + 2 == 3) {
    print("else if");
} else {
    print("else");
}

let firstName = "Yulong";
let firstName2 = "Yulong";
if firstName == firstName2 {
    print("Test comparison by ==")
}

let temp = 30
switch temp {
case 0:
    print("Brr! Freezing!")
case 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
     11, 12, 13, 14, 15, 16, 17, 18:
    print("Still damn cold!")
// All numbers from 30-45, including 30 and 45
case 30...45:
    print("Starting to get warm")
default:
    print("Meh")
}

let aPoint = (2, 0)
switch aPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}


// While loops
var index : Int = 0
while index < 5 {
    print("This is the \(index)th time I've said this")
    index += 1
}

// This is basically a do while loop
var anotherIndex : Int = 0
repeat {
    print("This is the \(index)th time I've said this")
    anotherIndex += 1
} while anotherIndex < 5


// For loops
let start: Int = 22
let end: Int = 25
// Declaring variable in for loop is optional
for i: Int in start...end {
    print(i);
}


