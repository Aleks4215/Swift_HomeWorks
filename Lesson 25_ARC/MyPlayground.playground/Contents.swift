
class Apartment {
    let address: String
    var rent: Double
    var person: Person? = nil

    init(address: String, rent: Double, person: Person? = nil) {
        self.address = address
        self.rent = rent
        self.person = person
        print("Apartment \(address) init")
    }

    deinit {
        print("Apartment \(address) deinit")
    }
}

class Person {
    let name: String
    var age: Int
    weak var apartment: Apartment?

    init(name: String, age: Int) {
        self.name = name
        self.age = age
        print("Person \(name) init")
    }

    deinit {
        print("Person \(name) deinit")
    }
}


var person1: Person? = Person(name: "123", age: 33)
var apartment: Apartment? = Apartment(address: "test test 123", rent: 20, person: nil)

person1?.apartment = apartment
apartment?.person = person1

person1 = nil
apartment = nil


