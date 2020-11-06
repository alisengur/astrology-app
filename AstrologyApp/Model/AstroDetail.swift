//
//  AstroDetail.swift
//  AstrologyApp
//
//  Created by Ali Şengür on 6.11.2020.
//  Copyright © 2020 Ali Şengür. All rights reserved.
//

import Foundation


struct AstroDetail: Codable {
    let ascendant: String?
    let ascendantLord: String?
    let varna: String?
    let vashya: String?
    let yoni: String?
    let gan: String?
    let nadi: String?
    let signlord: String?
    let sign: String?
    let naksahtra: String?
    let naksahtraLord: String?
    let charan: Int?
    let yog: String?
    let karan: String?
    let tithi: String?
    let yunja: String?
    let tatva: String?
    let nameAlphabet: String?
    let paya: String?
    
    
    private enum CodingKeys: String, CodingKey {
        case ascendant
        case ascendantLord = "ascendant_lord"
        case varna = "Varna"
        case vashya = "Vashya"
        case yoni = "Yoni"
        case gan = "Gan"
        case nadi = "Nadi"
        case signlord = "SignLord"
        case sign
        case naksahtra = "Naksahtra"
        case naksahtraLord = "NaksahtraLord"
        case charan = "Charan"
        case yog = "Yog"
        case karan = "Karan"
        case tithi = "Tithi"
        case yunja
        case tatva
        case nameAlphabet = "name_alphabet"
        case paya
    }
}
