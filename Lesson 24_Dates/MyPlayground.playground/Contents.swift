import UIKit
import Foundation

struct City {
    let name: String
    let timezoneOffset: Int
}

let cities: [City] = [
    City(name: "Нью-Йорк", timezoneOffset: -4),
    City(name: "Лондон", timezoneOffset: 0),
    City(name: "Токио", timezoneOffset: 9),
    City(name: "Москва", timezoneOffset: 3) // Москва: UTC+3
]

func displayTime(for city: City) {
    let currentDate = Date()
    
    let calendar = Calendar.current
    let utcOffsetInSeconds = TimeZone.current.secondsFromGMT() - (city.timezoneOffset * 3600)
    let localDate = calendar.date(byAdding: .second, value: -utcOffsetInSeconds, to: currentDate)!
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm:ss"
    
    let localTime = dateFormatter.string(from: localDate)
    print("Сейчас \(localTime) в городе \(city.name)")
}

for city in cities {
    displayTime(for: city)
}
