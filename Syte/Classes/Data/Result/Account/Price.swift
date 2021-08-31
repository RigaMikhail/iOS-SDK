//
//  Price.swift
//  Syte
//
//  Created by Artur Tarasenko on 25.08.2021.
//

import Foundation

public class Price: Codable, ReflectedStringConvertible {
    
    public var field: String?
    public var displayName: String?
    public var enabled: Bool?
    
}
