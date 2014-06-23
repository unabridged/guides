
import Foundation // or not

// Closures -----------------------------------------------------------

// Use typealias when closures are referenced in multiple places
typealias CoolClosure = (foo: Int) -> Bool

// Use aliased parameter names when function parameters are ambiguous
func yTown(some: Int, withCallback callback: CoolClosure) -> Bool {
    return CoolClosure(some)
}

// Use trailing closures
// Don't specify the type if the compiler can infer it
let cool = yTown(5) { foo in // instead of: { (foo: Int) in
    return foo == 6
}

// It's OK to use $ variable references if the closer is very short and
// readability is maintained
let cool = yTown(5) { $0 == 6 }

// Use full variable names when closures are more complex
let cool = yTown(5) { foo in
    if foo > 5 && foo < 0 {
        return true
    } else {
      return false
    }
}

// Optionals -----------------------------------------------------------

var maybe: Bool?

// Use if-let syntax to unwrap optionals
if let definitely = maybe {
    println("This is \(definitely) here")
}

// If the API you are using has implicit unwrapping you should still use if-let
func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
    if let index = indexPath {
        if let table = tableView {
            let cell = table.dequeue....
            return cell;
        }
    }
    
    return .None
}

// Enums --------------------------------------------------------------

enum Employee {
    case FullTime(name: String, office: String)
    case Apprentice(name: String, office: String, mentor: Employee)
}

// when the type is known you can let the compiler infer
let tony = Employee.FullTime(name: "Tony", office: "Boston")
let gordon: Employee = .Apprentice(name: "Gordon", office: "Boston", mentor: tony)

for employee in [tony, gordon] {
    switch employee {
    case let .FullTime(name, office):
        println("\(name) is a full time employee in \(office)")
    
    case let .Apprentice(name, office, mentor):
        println("\(name) is an apprentice in \(office) who is mentored by \(mentor.name)")
    }
}

