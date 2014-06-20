
import Foundation // or not

// Closures -----------------------------------------------------------

// Use typealias when closures are referenced in multiple places
typealias CoolClosure = (foo: Int) -> Bool

// Use aliased parameter names when function parameters are ambiguous
func yTown(some: Int, withCallback callback: CoolClosure) -> Bool {
    return CoolClosure(some)
}

// Use trailing closures
let cool = yTown(5) { (foo: Int) in
// or Don't cast parameters
let cool = yTown(5) { foo in
    return foo == 6
}

// Don't use $ variable references
let cool = yTown(5) { $0 == 6 }
// But shortening to one line with small closures is OK
let cool = yTown(5) { foo in foo == 6 }

// Optionals -----------------------------------------------------------

var maybe: Bool?

// Use if-let syntax to unwrap optionals
if let definitely = maybe {
    println("This is \(definitely) here")
}

// If the API you are using has implicit unwrapping you don't need if-let
// But still check for its existance
func privateAPI(callback: (error: NSError!) -> ()) {
    callback(.None)
}

privateAPI() { error in
    if error {
        println("Error: \(error)")
    }
}

// Enums --------------------------------------------------------------

enum Employee {
    case FullTime(name: String, office: String)
    case Apprentice(name: String, office: String, mentor: Employee)
}

// when the type is known you can let the compiler infer
let tony = Employee.FullTime(name: "Tony", office: "Boston")
let gordon: Employee = .Apprentice(name: "Gordon", office: "Boston", mentor: tony)

for emp in [tony, gordon] {
    switch emp {
    case .FullTime(let name, let office):
        println("\(name) is a full time employee in \(office)")
    
    case .Apprentice(let name, let office, let mentor):
        println("\(name) is an apprentice in \(office) who is mentored by \(mentor.name)")
    }
}

