//
//  Validation.swift
//  HotelBooking
//
//  Created by Sphinx04 on 08.09.23.
//

import Foundation

struct TouristValidation {
    var firstName: Bool?
    var lastName: Bool?
    var dateOfBirth: Bool?
    var residency: Bool?
    var passportNumber: Bool?
    var passportExpiration: Bool?

    var isValid: Bool? {
        if firstName == nil &&
            lastName == nil &&
            dateOfBirth == nil &&
            residency == nil &&
            passportNumber == nil &&
            passportExpiration == nil {
            return nil
        }
        return firstName ?? false &&
        lastName ?? false &&
        dateOfBirth ?? false &&
        residency ?? false &&
        passportNumber ?? false &&
        passportExpiration ?? false
    }
}

struct Validation {
    var email: Bool?
    var phoneNumber: Bool?
    var tourists: [TouristValidation] = []

    var isValid: Bool {
        return email ?? false &&
        phoneNumber ?? false && tourists.reduce(true, { $0 && $1.isValid ?? false })
    }
}
