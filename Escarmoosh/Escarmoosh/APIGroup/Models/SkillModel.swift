//
// Skill.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


public struct SkillModel: Codable {

    public var _id: String

    public var label: String
    public var win: Int
    public var total: Int
    public var value: Int
    
    public init(_id: String, label: String, win: Int, total: Int, value: Int) {
        self._id = _id
        self.label = label
        self.win = win
        self.total = total
        self.value = value
    }
    public enum CodingKeys: String, CodingKey { 
        case _id = "id"
        case label
        case win
        case total
        case value
    }

}
