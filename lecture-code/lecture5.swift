// Yulong Tan
// INFO 498 - iOS Development
// Lecture 5: 10.18.16

//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// Objective-C translation into Swift

/* Obj-C
 - (NSArray*)reverse:(NSArray*)array {
    NSMutableArray *inverted = [[NSMutableArray alloc] initWithArray:array];
    NSInteger invertedIndex = [array count] - 1;
    for (NSInteger i = 0; i < [array count]; i++) {
        inverted[i] = array[invertedIndex];
        invertedIndex--;
    }
    return inverted;
 }
*/

// My solution

public func reverse<T>(array: inout Array<T>) -> Array<T> {
    var inverted = array
    var invertedIndex = array.count - 1
    for i in 0...array.count {
        inverted[i] = array[invertedIndex]
        invertedIndex -= 1
    }
    return inverted
}

// Sam's solution
public func reverse(array: [Any]) -> [Any] {
    var inverted = Array(array)
    var invertedIndex : Int = array.count - 1
    for i in 0...array.count {
        inverted[i] = array[invertedIndex]
        invertedIndex -= 1
    }
    return inverted
}
