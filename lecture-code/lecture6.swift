// Yulong Tan
// INFO 498 - iOS Development
// Lecture 6: 11.8.16

//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import Foundation

PlaygroundPage.current.needsIndefiniteExecution = true

var str = "Hello, playground"

// Apple only lets you do things on safe channels unless otherwise specified
// Using https instead of http since it is more secure

var url = URL(string: "https://github.com")
var urlsession = URLSession.shared.dataTask(with: url!) {
    data, response, error in
    
    if (error != nil) {
        NSLog(error as! String)
    }
    
    if (data != nil) {
        NSLog(String(data: data!, encoding: String.Encoding.utf8)!)
    }
}

let data: Data // received from a network request, for example
let json = try? JSONSerialization.jsonObject(with: data, options: [])

// Example JSON with object root:
/*
	{
 "someKey": 42.0,
 "anotherKey": {
 "someNestedKey": true
 }
	}
 */
if let dictionary = jsonWithObjectRoot as? [String: Any] {
    if let number = dictionary["someKey"] as? Double {
        // access individual value in dictionary
    }
    
    for (key, value) in dictionary {
        // access all key / value pairs in dictionary
    }
    
    if let nestedDictionary = dictionary["anotherKey"] as? [String: Any] {
        // access nested dictionary values by key
    }
}

// Example JSON with array root:
/*
	[
 "hello", 3, true
	]
 */
if let array = jsonWithArrayRoot as? [Any] {
    if let firstObject = array.first {
        // access individual object in array
    }
    
    for object in array {
        // access all objects in array
    }
    
    for case let string as String in array {
        // access only string values in array
    }
}

struct Restaurant {
    enum Meal: String {
        case breakfast, lunch, dinner
    }
    
    let name: String
    let location: (latitude: Double, longitude: Double)
    let meals: Set<Meal>
}

extension Restaurant {
    private let urlComponents: URLComponents // base URL components of the web service
    private let session: URLSession // shared session for interacting with the web service
    
    static func restaurants(matching query: String, completion: ([Restaurant]) -> Void) {
        var searchURLComponents = urlComponents
        searchURLComponents.path = "/search"
        searchURLComponents.queryItems = [URLQueryItem(name: "q", value: query)]
        let searchURL = searchURLComponents.url!
        
        session.dataTask(url: searchURL, completion: { (_, _, data, _)
            var restaurants: [Restaurant] = []
            
            if let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                for case let result in json["results"] {
                    if let restaurant = Restaurant(json: result) {
                        restaurants.append(restaurant)
                    }
                }
            }
            
            completion(restaurants)
        }).resume()
    }
}
