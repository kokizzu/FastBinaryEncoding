//------------------------------------------------------------------------------
// Automatically generated by the Fast Binary Encoding compiler, do not modify!
// https://github.com/chronoxor/FastBinaryEncoding
// Source: enums.fbe
// FBE version: 1.15.0.0
//------------------------------------------------------------------------------

import Foundation

public struct EnumUInt16: Comparable, Hashable, Codable {
    typealias RawValue = UInt16
    public static let ENUM_VALUE_0 = EnumUInt16(value: EnumUInt16Enum.ENUM_VALUE_0)
    public static let ENUM_VALUE_1 = EnumUInt16(value: EnumUInt16Enum.ENUM_VALUE_1)
    public static let ENUM_VALUE_2 = EnumUInt16(value: EnumUInt16Enum.ENUM_VALUE_2)
    public static let ENUM_VALUE_3 = EnumUInt16(value: EnumUInt16Enum.ENUM_VALUE_3)
    public static let ENUM_VALUE_4 = EnumUInt16(value: EnumUInt16Enum.ENUM_VALUE_4)
    public static let ENUM_VALUE_5 = EnumUInt16(value: EnumUInt16Enum.ENUM_VALUE_5)

    var value: EnumUInt16Enum?

    public var raw: UInt16 { return value!.rawValue }

    public init() { setDefault() }
    public init(value: UInt16) { setEnum(value: value) }
    public init(value: EnumUInt16Enum) { setEnum(value: value) }
    public init(value: EnumUInt16) { setEnum(value: value) }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        setEnum(value: try container.decode(RawValue.self))
    }
    public mutating func setDefault() { setEnum(value: NSNumber(value: 0).uint16Value) }

    public mutating func setEnum(value: UInt16) { self.value = EnumUInt16Enum.mapValue(value: value) }
    public mutating func setEnum(value: EnumUInt16Enum) { self.value = value }
    public mutating func setEnum(value: EnumUInt16) { self.value = value.value }

    public static func < (lhs: EnumUInt16, rhs: EnumUInt16) -> Bool {
        guard let lhsValue = lhs.value, let rhsValue = rhs.value else {
            return false
            }
        return lhsValue.rawValue < rhsValue.rawValue
    }

    public static func == (lhs: EnumUInt16, rhs: EnumUInt16) -> Bool {
        guard let lhsValue = lhs.value, let rhsValue = rhs.value else {
            return false
            }
        return lhsValue.rawValue == rhsValue.rawValue
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(value?.rawValue ?? 0)
    }

    public var description: String {
        return value?.description ?? "<unknown>"
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(raw)
    }

    public func toJson() throws -> String {
        return String(data: try JSONEncoder().encode(self), encoding: .utf8)!
    }

    public static func fromJson(_ json: String) throws -> EnumUInt16 {
        return try JSONDecoder().decode(EnumUInt16.self, from: json.data(using: .utf8)!)
    }
}
