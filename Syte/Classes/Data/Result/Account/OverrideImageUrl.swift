//
//  OverrideImageUrl.swift
//  Syte
//
//  Created by Artur Tarasenko on 25.08.2021.
//

import Foundation

public class OverrideImageUrl: Codable, ReflectedStringConvertible {
    
    public var active: Bool?
    public var selector: String?
    public var attribute: String?
    
}
