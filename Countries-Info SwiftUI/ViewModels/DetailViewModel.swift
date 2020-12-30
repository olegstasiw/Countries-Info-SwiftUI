//
//  DetailViewModel.swift
//  SwiftUI Countries
//
//  Created by Oleh Stasiv on 28.12.2020.
//

import Foundation

protocol CountryDetailsViewModelProtocol {
    var countryName: String { get }
    var capital: String { get }
    var region: String { get }
    var population: String { get }
    var currencies: [String] { get }
    var languages: [String] { get }
    var timeZones: [String] { get }
    var callingCodes: [String] { get }
    var alpha2Code: String { get }
    
    init(country: Country)
}

class CountryDetailsViewModel: CountryDetailsViewModelProtocol {
    
    var countryName: String {
        if country.name == "" { return "No name" }
        return country.name
    }
    var capital: String {
        if country.capital == "" { return "No capital" }
        return country.capital
    }
    var region: String {
        country.subregion?.region.name ?? "No region"
    }
    var population: String {
        String(setPoputation(population: country.population))
    }
    
    var currencies: [String] {
        var array: [String] = []
        country.currencies.forEach { array.append($0.name) }
        if array.isEmpty { return ["No currencies"] }
        return array
    }
    
    var languages: [String] {
        var array: [String] = []
        country.officialLanguages.forEach { array.append($0.name) }
        if array.isEmpty { return ["No languages"] }
        return array
    }
    var timeZones: [String] {
        var array: [String] = []
        country.timezones.forEach { array.append(setGMTTimeZone(zone: $0.name)) }
        if array.isEmpty { return ["No time zones"] }
        return array
    }
    var callingCodes: [String] {
        var array: [String] = []
        country.callingCodes.forEach { array.append("+\($0.name)") }
        if array.isEmpty { return ["No calling codes"] }
        return array
    }
    var alpha2Code: String {
        return country.alpha2Code.lowercased()
    }
    
    private let country: Country
    
    required init(country: Country) {
        self.country = country
    }
    
    private func setGMTTimeZone(zone: String) -> String {
        var timeZone = zone
        let formatter = DateFormatter()
        formatter.dateFormat = "H:mm"
        if let utc = zone.range(of: "UTC") {
            timeZone.removeSubrange(utc)
            if let plus = timeZone.range(of: "+") {
                timeZone.removeSubrange(plus)
                guard  let date = formatter.date(from: timeZone) else {
                    return "GMT + 0"
                }
                timeZone = "GMT + \(formatter.string(from: date))"
                return timeZone
            } else if let minus = timeZone.range(of: "-") {
                timeZone.removeSubrange(minus)
                guard  let date = formatter.date(from: timeZone) else {
                    return "GMT + 0"
                }
                timeZone = "GMT - \(formatter.string(from: date))"
                return timeZone
                
            } else {
                return "GMT + 0"
            }
        }
        timeZone = "GMT + 0"
        return timeZone
    }
    
    
    private func setPoputation(population: Double) -> String {
        var number = population
        if population >= 1000000 {
            number /= 1000000
            let str = String(number.rounded(toPlaces: 2)) + " m"
            return str.replacingOccurrences(of: ".", with: ",")
            
        } else {
            number /= 1000
            let str = String(number.rounded(toPlaces: 2)) + " k"
            return str.replacingOccurrences(of: ".", with: ",")
        }
    }
}


extension Double {
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
