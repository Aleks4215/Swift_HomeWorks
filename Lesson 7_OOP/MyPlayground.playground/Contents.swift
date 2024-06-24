import UIKit

class Person {
    let name: String
    let surname: String
    var age: Int
    
    init(name: String, surname: String, age: Int) {
        self.name = name
        self.surname = surname
        self.age = age
    }
}

class Director: Person {
    private let experience: String
    private let rating: Double
    
    init(experience: String, rating: Double, name: String, surname: String, age: Int) {
        self.experience = experience
        self.rating = rating
        super.init(name: name, surname: surname, age: age)
    }
}

class Pupil: Person {
    private var classNumber: Int
    private var schoolAssessment: (subject: String, assessment: Int)
    
    init(classNumber: Int, schoolAssessment: (subject: String, assessment: Int), name: String, surname: String, age: Int) {
        self.classNumber = classNumber
        self.schoolAssessment = schoolAssessment
        super.init(name: name, surname: surname, age: age)
    }
    
    func aboutPupil() {
        print("Фамилия \(surname) Имя \(name)(класс \(classNumber)) предмет \(schoolAssessment.subject) : оценка \(schoolAssessment.assessment)")
    }
}


struct Address {
    let x: String
    let y: String
    let streetName: String
}


struct School {
    var students: [Pupil]
    var titile: String
    
    let director: Director
    let address: Address
    
    func aboutSchool( ) {
        print("Школа \(titile), директор \(director.name) \(director.surname), ученики \(students.count), x \(adress.x), y \(adress.y), название улицы \(adress.streetName)")
    }
}

let pupil = Pupil(classNumber: 1, schoolAssessment: ("Информатика", 4), name: "Василий", surname: "Пупкин", age: 6)
let director = Director(experience: "10 лет", rating: 10, name: "Григорий", surname: "Васильев", age: 44)
let adress = Address(x: "123", y: "12", streetName: "Улица Пушкина")
let school = School(students: [pupil], titile: "1", director: director, address: adress)
pupil.aboutPupil()
school.aboutSchool()
