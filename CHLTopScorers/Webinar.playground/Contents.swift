import Foundation

// MARK: Section 1 - Simple types

// MARK: 1 - Variables
                    // type-safe language
var str = "Hello, playground" // String

str = "Goodbye"

// MARK: 2 - Strings and integers

var age = 38 // Int

var population = 8_000_000 // readability

// MARK: 3 - Multi-line strings

var str1 = """
This goes
over multiple
lines
"""

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

// MARK: 7 - Type annotations

let album: String = "Reputation"
let year: Int = 1989
let height: Double = 1.78
let taylorRocks: Bool = true

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

// MARK: 9 - Sets

// Sets are collections of values just like arrays, except they have two differences:
// - Items aren’t stored in any order; they are stored in what is effectively a random order.
// - No item can appear twice in a set; all items must be unique.
let colors = Set(["red", "green", "blue"])
let colors2 = Set(["red", "green", "blue", "red", "blue"])

// MARK: 10 - Tuples

var name = (first: "John", age: 24)
name.0
name.1
name.first
name.age

// MARK: 11 - Arrays vs sets vs tuples

// specific, fixed collection of related values -> Tuple
let address = (house: 555, street: "55th Avenue", city: "New York")

// collection of values that must be unique or you need to be able to check whether a specific item is in there extremely quickly -> Set
let set = Set(["aardvark", "astronaut", "azalea"])

// Most common collection of values that can contain duplicates, or the order of your items matters -> Array
let names = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]

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

favoriteIceCream["Charlotte", default: "Unknown"]

// MARK: 14 Creating empty collections

var teams = [String: String]()
teams["Paul"] = "Red"

var ints = [Int]()

var words = Set<String>()
var numbers = Set<Int>()

var scores = Dictionary<String, Int>()
var intResults = Array<Int>()

// MARK: 15 Enumerations
// Enumerations – usually called just enums – are a way of defining groups of related values in a way that makes them easier to use.

enum Result {
    case success
    case failure
}

let result4 = Result.failure

// MARK: 16 Enum associated values

//enum Activity {
//    case bored
//    case running
//    case talking
//    case singing
//}

enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}

let talking = Activity.talking(topic: "football")

// MARK: 17 Enum raw values

enum Planet: Int {
    case mercury
    case venus
    case earth
    case mars
}

let earth = Planet(rawValue: 2)

//enum Planet: Int {
//    case mercury = 1
//    case venus // 2
//    case earth // 3
//    case mars // 4
//}

// MARK: Section 3 - Operators and conditions

// MARK: 18 Arithmetic operators

let firstScore = 12
let secondScore = 4

let total = firstScore + secondScore
let difference = firstScore - secondScore

let product = firstScore * secondScore
let divided = firstScore / secondScore

let remainder = 13 % secondScore

// MARK: 19 Operator Overloading

let meaningOfLife = 42
let doubleMeaning = 42 + 42

let fakers = "Fakers gonna "
let action = fakers + "fake"

let firstHalf = ["John", "Paul"]
let secondHalf = ["George", "Ringo"]
let beatles2 = firstHalf + secondHalf

// Remember, Swift is a type-safe language, which means it won’t let you mix types

// MARK: 20 Compound assignment operators

var score2 = 95
score2 -= 5

var quote = "The rain in Spain falls mainly on the "
quote += "Spaniards"

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

// MARK: 24 The ternary operator

let firstCardA = 11
let secondCardA = 10
print(firstCard == secondCard ? "Cards are the same" : "Cards are different")

if firstCardA == secondCardA {
    print("Cards are the same")
} else {
    print("Cards are different")
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

switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
    fallthrough // If you want execution to continue on to the next case, use the fallthrough keyword like this:
default:
    print("Enjoy your day!")
}

// MARK: 26 Range operators

let scoreB = 85

switch scoreB {
case 0..<50:
    print("You failed badly.")
case 50..<85:
    print("You did OK.")
default:
    print("You did great!")
}

// MARK: Section 4 - Looping

// MARK: 27 For loops

let count = 1...10
for number in count {
    print("Number is \(number)")
}

let albums = ["Red", "1989", "Reputation"]

for album in albums {
    print("\(album) is on Apple Music")
}

print("Players gonna ")

for _ in 1...5 {
    print("play")
}

// MARK: 28 While loops

var num = 1

while num <= 20 {
    print(num)
    num += 1
}

print("Ready or not, here I come!")

// MARK: 29 Repeat loops

var number = 1

repeat {
    print(number)
    number += 1
} while number <= 20

print("Ready or not, here I come!")

// Because the condition comes at the end of the repeat loop the code inside the loop will always be executed at least once, whereas while loops check their condition before their first run.

//while false {
//    print("This is false") // never executes
//}

repeat {
    print("This is false") // executes once
} while false

// MARK: 30 Exiting loops

var countDown = 10
// normal
while countDown >= 0 {
    print(countDown)
    countDown -= 1
}

print("Blast off!")

var countDown2 = 10
// breaks
while countDown2 >= 0 {
    print(countDown2)

    if countDown2 == 4 {
        print("I'm bored. Let's go now!")
        break
    }

    countDown2 -= 1
}

// MARK: 31 Exiting multiple loops

for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")
    }
}

outerLoop: for i in 1...10 { // give label
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")

        if product == 50 {
            print("It's a bullseye!")
            break outerLoop
        }
    }
}

// MARK: 32 Skipping items

for i in 1...10 {
    if i % 2 == 1 {
        continue
    }

    print(i)
}

// MARK: 33 Infinite loops

var counter = 0

while true {
    print(" ")
    counter += 1

    if counter == 273 {
        break // Warning: Please make sure you have a check that exits your loop, otherwise it will never end.
    }
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

// if anyone asks for print and types

/// - Parameters:
///   - items: Zero or more items to print.
///   - separator: A string to print between each item. The default is a single
///     space (`" "`).
///   - terminator: The string to print after all items have been printed. The
///     default is a newline (`"\n"`).
//public func print(_ items: Any..., separator: String = " ", terminator: String = "\n")

// MARK: 36 Returning values

func square(number: Int) -> Int {
    return number * number
}

let result = square(number: 8)
print(result)

// MARK: 37 Parameter labels

func sayHello(to name: String) {
    print("Hello, \(name)!")
}

sayHello(to: "Taylor")

// MARK: 38 Omitting parameter labels

func greet(_ person: String) {
    print("Hello, \(person)!")
}

greet("Taylor")

// MARK: 39 Default parameters

func greetWithDefault(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}

greetWithDefault("Taylor")
greetWithDefault("Taylor", nicely: false)

// MARK: 40 Variadic functions

print("Haters", "gonna", "hate")

func square(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}

square(numbers: 1, 2, 3, 4, 5)

// MARK: 41 Writing throwing functions

enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

// MARK: 42 Running throwing functions

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password. error: \(error.localizedDescription)")
}

// MARK: 43 inout parameters
// All parameters passed into a Swift function are constants, so you can’t change them. If you want, you can pass in one or more parameters as inout, which means they can be changed inside your function, and those changes reflect in the original value outside the function.

func doubleInPlace(number: inout Int) {
    number *= 2
}

var myNum = 10
doubleInPlace(number: &myNum)

// MARK: Section 6 - Closures

// MARK: 43 Creating basic closures
// Swift lets us use functions just like any other type such as strings and integers. This means you can create a function and assign it to a variable, call that function using that variable, and even pass that function into other functions as parameters.

// Functions used in this way are called closures, and although they work like functions they are written a little differently.
let driving = {
    print("I'm driving in my car")
}

driving()

// MARK: 44 Accepting parameters in a closure

let drivingPlace = { (place: String) in
    print("I'm going to \(place) in my car")
}

drivingPlace("London")

// MARK: 45 Returning values from a closure

let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

let message = drivingWithReturn("London")
print(message)

// MARK: 46 Closures as parameters

func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

travel(action: driving)

// MARK: 47 Trailing closure syntax

func travel2(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

travel2() {
    print("I'm driving in my car")
}

// because there aren’t any other parameters

travel2 {
    print("I'm driving in my car")
}

// MARK: 48 Using closures as parameters when they accept parameters

func travel3(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}

travel3 { (place: String) in
    print("I'm going to \(place) in my car")
}

// MARK: 49 Using closures as parameters when they return values

func travel4(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}

// MARK: 50 Shorthand parameter names

func travel5(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}

travel5 { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

// drop ( :String)

travel5 { place -> String in
    return "I'm going to \(place) in my car"
}

// drop -> String

travel5 { place in
    return "I'm going to \(place) in my car"
}

// drop -> return

travel5 { place in
    "I'm going to \(place) in my car"
}

// drop -> place in (shorthand syntax)

travel5 {
    "I'm going to \($0) in my car"
}

// MARK: 51 Closures with multiple parameters

func travel6(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived!")
}

travel6 {
    "I'm going to \($0) at \($1) miles per hour."
}

// MARK: 52 Returning closures from functions

func travel7() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}

let travelResult = travel7()
travelResult("London")

travel7()("London")

// MARK: 52 Capturing values

// no capturing
//func travel8() -> (String) -> Void {
//    return {
//        print("I'm going to \($0)")
//    }
//}
//
//let travelResult1 = travel8()
//travelResult1("London")

// Closure capturing happens if we create values in travel() that get used inside the closure

func travel8() -> (String) -> Void {
    var counter = 1

    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}

let travel8Result = travel8() // countered captured here
travel8Result("London")
travel8Result("London")
travel8Result("London")

// MARK: Section 7 - Structs

// MARK: 53 Creating your own structs

struct Sport {
    var name: String
}

var tennis = Sport(name: "Tennis")
print(tennis.name)

tennis.name = "Lawn tennis"

// MARK: 54 Computed properties

struct OtherSport {
    var name: String
    var isOlympicSport: Bool

    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}

let chessBoxing = OtherSport(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)

// MARK: 55 Property observers
// Property observers let you run code before or after any property changes.

struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}

var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100

// you can also use willSet to take action before a property changes, but that is rarely used.

// MARK: 56 Methods

struct City {
    var population: Int

    func collectTaxes() -> Int {
        return population * 1000
    }
}

let london = City(population: 9_000_000)
london.collectTaxes()

// MARK: 57 Mutating methods
// If a struct has a variable property but the instance of the struct was created as a constant, that property can’t be changed – the struct is constant, so all its properties are also constant regardless of how they were created.
// The problem is that when you create the struct Swift has no idea whether you will use it with constants or variables, so by default it takes the safe approach: Swift won’t let you write methods that change properties unless you specifically request it.
struct Person {
    var name: String

    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}

// demo change to let
var person = Person(name: "Ed")
person.makeAnonymous()

// MARK: 58 Properties and methods of strings

// Strings are structs

let string = "Do or do not, there is no try."
print(string.count)
print(string.hasPrefix("Do"))
print(string.uppercased())
print(string.sorted())

// MARK: 59 Properties and methods of arrays

// Arrays are also structs

var toys = ["Woody"]
print(toys.count)
toys.append("Buzz")
toys.firstIndex(of: "Buzz")
print(toys.sorted())
toys.remove(at: 0)

// and more, more,... try toys. and check autocomplete list

// MARK: 60 Initializers
// All structs come with one initializer by default, called their memberwise initializer – this asks you to provide a value for each property when you create the struct.
struct User {
    var username: String
}

var user = User(username: "Nick")

// We can provide our own initializer to replace the default one.

struct AnonymousUser {
    var username: String

    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}

// You don’t write func before initializers, but you do need to make sure all properties have a value before the initializer ends.

var anonymousUser = AnonymousUser()
anonymousUser.username = "Nick"

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

// MARK: 62 Lazy properties

struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

struct OtherPerson {
    var name: String
    lazy var familyTree = FamilyTree()

    init(name: String) {
        self.name = name
    }
}

var ed = OtherPerson(name: "Ed")

// But what if we didn’t always need the family tree for a particular person? If we add the lazy keyword to the familyTree property, then Swift will only create the FamilyTree struct when it’s first accessed:
//ed.familyTree // comment out and re-run

// MARK: 63 Static properties and methods

struct Student {
    var name: String

    init(name: String) {
        self.name = name
    }
}

let mark = Student(name: "Mark")
let bob = Student(name: "Bob")

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

// MARK: 68 Final classes

// Although class inheritance is very useful – and in fact large parts of Apple’s platforms require you to use it – sometimes you want to disallow other developers from building their own class based on yours.
// Swift gives us a final keyword just for this purpose

final class OtherDog {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

// MARK: 69 Copying objects

class Singer {
    var name = "Eddie Vedder"
}

var singer = Singer()
print(singer.name)

// try to copy
var singerCopy = singer
singerCopy.name = "Justin Bieber"

// Because of the way classes work, both singer and singerCopy point to the same object in memory, so when we print the singer name again we’ll see “Justin Bieber”:
print(singer.name)

// demonstrate try with struct

// MARK: 70 Deinitializers

class Player {
    var name = "John Doe"

    init() {
        print("\(name) is alive!")
    }

    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    
    deinit {
        print("\(name) is no more!")
    }
}

for _ in 1...3 {
    let player = Player()
    player.printGreeting()
}

// MARK: 71 Mutability
// The final difference between classes and structs is the way they deal with constants. If you have a constant struct with a variable property, that property can’t be changed because the struct itself is constant.

// However, if you have a constant class with a variable property, that property can be changed. Because of this, classes don’t need the mutating keyword with methods that change properties; that’s only needed with structs.

class League {
    var name = "SuperLeague"
}

let league = League()
league.name = "Stoiximan Superleague"
print(league.name)

// demo -> change to let name

// MARK: Section 8 - Protocols and extensions

// MARK: 72 Protocols
// Protocols are a way of describing what properties and methods something must have. You then tell Swift which types use that protocol – a process known as adopting or conforming to a protocol.

//protocol Identifiable {
//    var id: String { get set }
//}

// We can’t create instances of that protocol - it’s a description of what we want, rather than something we can create and use directly. But we can create a struct that conforms to it:

//struct Region: Identifiable {
//    var id: String
//}

//func displayID(thing: Identifiable) {
//    print("My ID is \(thing.id)")
//}

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

extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

8.isEven

// MARK: 75 protocol extensions

// Protocols let you describe what methods something should have, but don’t provide the code inside. Extensions let you provide the code inside your methods, but only affect one data type – you can’t add the method to lots of types at the same time.
// Protocol extensions solve both those problems: they are like regular extensions, except rather than extending a specific type like Int you extend a whole protocol so that all conforming types get your changes.

let footballTeams = ["OSFP", "PAO", "AEK", "PAOK", "ARIS"]
let countries = Set(["Greece", "Italy", "Brazil", "Germany"])

// Array and Set both conform to Collection

extension Collection {
    func summarize() {
        print("There are \(count) of us:")

        for name in self {
            print(name)
        }
    }
}

footballTeams.summarize()
countries.summarize()

// MARK: 76 Protocol-oriented programming

protocol Identifiable {
    var id: String { get set }
    func identify()
}

extension Identifiable {
    func identify() {
        print("My ID is \(id).")
    }
}

struct Country: Identifiable {
    var id: String
}

let greece = Country(id: "GR")
greece.identify()

// MARK: Section 9 - Optionals

// MARK: 76 Handling missing data

// We’ve used types such as Int to hold values like 5. But if you wanted to store an age property for users, what would you do if you didn’t know someone’s age?

// 1) we can store 0 but what about new-born babies?

// 2) special impossible number 1000 -1 -> unknown but would you remember after 5 months that number?

// Swift solution is called optional and supports any type

var someAge: Int? = nil // means no value

someAge = 38

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

// MARK: 79 Force unwrapping

// Optionals represent data that may or may not be there, but sometimes you know for sure that a value isn’t nil. In these rare cases, Swift lets you force unwrap the optional: convert it from an optional type to a non-optional type.

let numString = "5"
let integer = Int(numString)!

// MARK: 80 Implicitly unwrapped optionals

// Like regular optionals, implicitly unwrapped optionals might contain a value or they might be nil. However, unlike regular optionals you don’t need to unwrap them in order to use them: you can use them as if they weren’t optional at all.
// – if they are nil – your code crashes.
// That being said, if you’re able to use regular optionals instead it’s generally a good idea.

let anotherAge: Int! = nil

// MARK: 81 Nil coalescing
// The nil coalescing operator unwraps an optional and returns the value inside if there is one. If there isn’t a value – if the optional was nil – then a default value is used instead.

func username(for id: Int) -> String? {
    if id == 1 {
        return "Jack Sparrow"
    } else {
        return nil
    }
}

let usr = username(for: 15) ?? "Anonymous"

// MARK: 82 Optional chaining
// Swift provides us with a shortcut when using optionals: if you want to access something like a.b.c and b is optional, you can write a question mark after it to enable optional chaining: a.b?.c.
let beatlesNames = ["John", "Paul", "George", "Ringo"]

let beatl = names.first?.uppercased()

// MARK: 83 Optional try

enum SomeError: Error {
    case wrongPassword
}

func check(_ password: String) throws -> Bool {
    if password == "password" {
        throw SomeError.wrongPassword
    }

    return true
}

do {
    try check("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

if let result = try? check("password") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}

try! check("sekrit")
print("OK!")

// MARK: 84 Failable initializers

// let str = "5"
// let num = Int(str) -> init?()

struct Document {
    var id: String

    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

// MARK: 85 Typecasting

class Animal { }
class Fish: Animal { }

class Cat: Animal {
    func makeNoise() {
        print("Meaw!")
    }
}

let pets = [Fish(), Cat(), Fish(), Cat()]

for pet in pets {
    if let cat = pet as? Cat {
        cat.makeNoise()
    }
}

protocol Payload {}

struct OnePayload: Payload {
    let one: String
}

struct TwoPayload: Payload {
    let two: Int
}

struct Wrapper {
    let payload: Payload
}
