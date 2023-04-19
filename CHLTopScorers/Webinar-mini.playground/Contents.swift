import Foundation

// MARK: Section 1 - Simple types

// MARK: 1 - Variables
// type-safe language

var str = "Hello, playground" // String

str = "Goodbye"

// MARK: 2 - Strings and integers

var age = 38 // Int

// MARK: 4 - Doubles and booleans
// “Double” is short for “double-precision floating-point number"
// Doubles are different from integers, and you can’t mix them by accident.
var pi = 3.141 // Double

var awesome = true // Bool

// MARK: 5 - String interpolation

var score = 85
var str2 = "Your score was \(score)"

var results = "The test results are here: \(str2)"

// MARK: 6 - Constants

let taylor = "swift" // immutable
//taylor = ""

// MARK: Section 2 - Complex types

// MARK: 8 - Arrays

let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"

let beatles = [john, paul, george, ringo]

beatles[1]

// beatles[8]
// Type annotations for arrays [String], [Int], [Double], and [Bool]

// MARK: 12 - Dictionaries
// collections of values just like arrays, but rather than storing things with an integer position you can access them using anything you want.
let heights = [
    "Taylor Swift": 1.78,
    "Ed Sheeran": 1.73
]
heights["Taylor Swift"]

// Type annotations [String: Double] and [String: String]

// MARK: 13 - Dictionaries and default values

let favoriteIceCream = [
    "Paul": "Chocolate",
    "Sophie": "Vanilla"
]

favoriteIceCream["Paul"]

favoriteIceCream["Charlotte"]


// MARK: 15 Enumerations
// Enumerations – usually called just enums – are a way of defining groups of related values in a way that makes them easier to use.

enum Result {
    case success
    case failure
}

let result4 = Result.failure

// MARK: Section 3 - Operators and conditions

// MARK: 18 Arithmetic operators

let firstScore = 12
let secondScore = 4

let total = firstScore + secondScore
let difference = firstScore - secondScore

let product = firstScore * secondScore
let divided = firstScore / secondScore

let remainder = 13 % secondScore

// MARK: 21 Comparison operators

let firstScoreA = 6
let secondScoreA = 4

firstScoreA == secondScoreA
firstScoreA != secondScoreA

firstScoreA < secondScoreA
firstScoreA >= secondScoreA

"Taylor" <= "Swift" // strings have a natural alphabetical order

// MARK: 22 Conditions

let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 21 {
    print("Blackjack!")
}

if firstCard + secondCard == 21 {
    print("Blackjack!")
} else {
    print("Regular cards")
}

if firstCard + secondCard == 2 {
    print("Aces – lucky!")
} else if firstCard + secondCard == 21 {
    print("Blackjack!")
} else {
    print("Regular cards")
}

// MARK: 23 Combining conditions

let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18 {
    print("Both are over 18")
}

if age1 > 18 || age2 > 18 {
    print("At least one is over 18")
}

// MARK: 25 Switch statements

let weather = "sunny"

switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
default:
    print("Enjoy your day!")
}

// MARK: Section 4 - Looping

// MARK: 27 For loops

let albums = ["Red", "1989", "Reputation"]

for album in albums {
    print("\(album) is on Apple Music")
}

print("Players gonna ")

for _ in 1...5 {
    print("play")
}

// MARK: Section 5 - Functions

// MARK: 34 Writing functions

// Functions let us re-use code
func printHelp() {
    let message = """
Welcome to MyApp!

Functions let us re-use code
"""

    print(message)
}

printHelp()

// MARK: 35 Accepting parameters

// print() is a function that accepts one parameter
print("Hello, world!")

func printSquare(number: Int) {
    print(number * number)
}

printSquare(number: 8)

// MARK: 36 Returning values

func square(number: Int) -> Int {
    return number * number
}

let result = square(number: 8)
print(result)

// MARK: Section 6 - Closures

// MARK: 43 Creating basic closures
// Swift lets us use functions just like any other type such as strings and integers. This means you can create a function and assign it to a variable, call that function using that variable, and even pass that function into other functions as parameters.

// Functions used in this way are called closures, and although they work like functions they are written a little differently.
let driving = {
    print("I'm driving in my car")
}

driving()

// MARK: Section 7 - Structs

// MARK: 53 Creating your own structs

struct Sport {
    var name: String
}

var tennis = Sport(name: "Tennis")
print(tennis.name)

tennis.name = "Lawn tennis"

// MARK: 56 Methods

struct City {
    var population: Int

    func collectTaxes() -> Int {
        return population * 1000
    }
}

let london = City(population: 9_000_000)
london.collectTaxes()

// MARK: 60 Initializers
// All structs come with one initializer by default, called their memberwise initializer – this asks you to provide a value for each property when you create the struct.

// MARK: 61 Referring to the current instance
// Inside methods you get a special constant called self, which points to whatever instance of the struct is currently being used.
// This self value is particularly useful when you create initializers that have the same parameter names as your property.
// self helps you distinguish between the property and the parameter – self.name refers to the property, whereas name refers to the parameter.
struct SomePerson {
    var name: String

    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}

// MARK: 63 Static properties and methods

// All the properties and methods we’ve created so far have belonged to individual instances of structs
// You can also ask Swift to share specific properties and methods across all instances of the struct by declaring them as static
struct OtherStudent {
    static var classSize = 0
    var name: String

    init(name: String) {
        self.name = name
        OtherStudent.classSize += 1
    }
}

print(OtherStudent.classSize)

// MARK: 64 Access control
// default access control is internal
struct Team {
    private var id: String

    init(id: String) {
        self.id = id
    }
    
    func identify() -> String {
        return "Team id is \(id)"
    }
}

let real = Team(id: "realID")

// real.id is not accessible now
real.identify()

// Another common option is public, which lets all other code use the property or method. We are using this one when we need multiple modules for one project

// MARK: Section 7 - Classes

// MARK: 65 Creating your own class
// Classes are similar to structs in that they allow you to create new types with properties and methods, but they have 5 important differences

class Dog {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

let poppy = Dog(name: "Poppy", breed: "Poodle")

// MARK: 66 Class inheritance or subclassing

class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
}

// For safety reasons, Swift always makes you call super.init() from child classes

// MARK: 67 overriding methods
// Child classes can replace parent methods with their own implementations
class SomeDog {
    func makeNoise() {
        print("Woof!")
    }
}

class SomePoodle: SomeDog {
    // demo without override first
    override func makeNoise() {
        print("Yip!")
    }
}

let poppy2 = SomePoodle()
poppy2.makeNoise()

// demo -> change to let name

// MARK: Section 8 - Protocols and extensions

// MARK: 72 Protocols
// Protocols are a way of describing what properties and methods something must have. You then tell Swift which types use that protocol – a process known as adopting or conforming to a protocol.

// MARK: 72 Protocols
//protocol IdentifiableProtocol {
//    var id: String { get set }
//}
//
//struct Region: IdentifiableProtocol {
//    var id: String
//}
//
//func displayID(thing: IdentifiableProtocol) {
//    print("My ID is \(thing.id)")
//}
//
//let region = Region(id: "1")
//displayID(thing: region)

// MARK: 73 Protocol inheritance

// One protocol can inherit from another in a process known as protocol inheritance. Unlike with classes, you can inherit from multiple protocols at the same time before you add your own customizations on top.

protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation { }

// Now we can make new types conform to that single protocol rather than each of the three individual ones.

// MARK: 74 Extensions
 
// Extensions allow you to add methods to existing types, to make them do things they weren’t originally designed to do.

extension Int {
    func squared() -> Int {
        return self * self
    }
}

2.squared()

// MARK: Section 9 - Optionals

// MARK: 77 Unwrapping optionals

var fullName: String? = nil

// What happens if we use name.count? A real string has a count property that stores how many letters it has, but this is nil – it’s empty memory, not a string, so it doesn’t have a count.

// Because of this, trying to read name.count is unsafe and Swift won’t allow it. Instead, we must look inside the optional and see what’s there – a process known as unwrapping.

// common way using if let
if let unwrapped = fullName {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name.")
}

// MARK: 78 Unwrapping with guard

// An alternative to if let is guard let, which also unwraps optionals. guard let will unwrap an optional for you, but if it finds nil inside it expects you to exit the function, loop, or condition you used it in.
// However, the major difference between if let and guard let is that your unwrapped optional remains usable after the guard code.

func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }

    print("Hello, \(unwrapped)!")
}
greet(nil)
greet("Jack")
