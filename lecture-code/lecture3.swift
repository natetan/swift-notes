//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// Value type (use struct)

// self is the same as the keyword 'this'
struct Money {
    private var pennies : Int32 = 0
    // Computed property, so amount should not be given in a constructor call
    var amount : Int32 {
        get { return pennies / 100; }
        set(newvalue) { self.pennies = newvalue / 2; }
    }
    
    // Initializer, so constructor needs an initializer, or set a default
    init(amt: Int32 = 0) {
        self.amount = amt
    }
}


class Person {
    // Swift knows how to initialize these fields
    // init is the constructor
    var firstName: String = ""
    var lastName: String = ""
    var age: UInt8 = 0
    
    static var totalPopulation = 0
    static func printPopulation() {
        print("There are \(Person.totalPopulation) Persons in existence")
    }
    
    init(fn: String, ln: String) {
        firstName = fn
        lastName = ln
        Person.totalPopulation += 1
    }
    
    func hello() {
        print("\(firstName) says hello")
    }
    
    func getOlder() {
        print("\(firstName) has a birthday!")
        self.age == 1
    }
}
func ==(lhs: Person, rhs: Person) -> Bool {
    return (lhs.firstName == rhs.firstName) &&
        (lhs.lastName == rhs.lastName)
}

func !=(lhs: Person, rhs: Person) -> Bool {
    return (lhs.firstName != rhs.firstName) &&
        (lhs.lastName != rhs.lastName)
}


// Inheritence (Student inherits Person)
// Only classes can inherit
class Student : Person {
    var subject : String
    
    init?(fn: String, ln: String, subject: String) {
        if (subject == "Philosophy") {
            return nil
        }
        
        self.subject = subject
        // Calls Person's constructor
        super.init(fn: fn, ln: ln)
    }
    
    override func getOlder() {
        print("DRINK DRINK DRINK")
        super.getOlder()
    }
}

let m = Money() // Money
let m2 = m                                // Money

let p = Person(fn: "Yulong", ln: "Tan")
p.hello()
Person.printPopulation()

// Equality checks

let p2 = Person(fn: "Yulong", ln: "Tan")
// Are the firstname and lastname the same?
if (p == p2) {
    print("yes")
}
// Are they pointing to the same object?
if (p === p2) {
    print("Identical")
} else {
    print("different")
}
