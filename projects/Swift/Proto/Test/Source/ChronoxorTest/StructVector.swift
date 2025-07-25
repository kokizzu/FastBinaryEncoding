//------------------------------------------------------------------------------
// Automatically generated by the Fast Binary Encoding compiler, do not modify!
// https://github.com/chronoxor/FastBinaryEncoding
// Source: test.fbe
// FBE version: 1.15.0.0
//------------------------------------------------------------------------------

import Foundation
import ChronoxorFbe
import ChronoxorProto

public protocol StructVectorBase {
    var f1: Array<UInt8> { get set }
    var f2: Array<UInt8?> { get set }
    var f3: Array<Data> { get set }
    var f4: Array<Data?> { get set }
    var f5: Array<EnumSimple> { get set }
    var f6: Array<EnumSimple?> { get set }
    var f7: Array<FlagsSimple> { get set }
    var f8: Array<FlagsSimple?> { get set }
    var f9: Array<StructSimple> { get set }
    var f10: Array<StructSimple?> { get set }
}

public protocol StructVectorInheritance {
    var parent: StructVector { get set }
}

extension StructVectorInheritance {
    public var f1: Array<UInt8> {
        get { return parent.f1 }
        set { parent.f1 = newValue }
    }
    public var f2: Array<UInt8?> {
        get { return parent.f2 }
        set { parent.f2 = newValue }
    }
    public var f3: Array<Data> {
        get { return parent.f3 }
        set { parent.f3 = newValue }
    }
    public var f4: Array<Data?> {
        get { return parent.f4 }
        set { parent.f4 = newValue }
    }
    public var f5: Array<EnumSimple> {
        get { return parent.f5 }
        set { parent.f5 = newValue }
    }
    public var f6: Array<EnumSimple?> {
        get { return parent.f6 }
        set { parent.f6 = newValue }
    }
    public var f7: Array<FlagsSimple> {
        get { return parent.f7 }
        set { parent.f7 = newValue }
    }
    public var f8: Array<FlagsSimple?> {
        get { return parent.f8 }
        set { parent.f8 = newValue }
    }
    public var f9: Array<StructSimple> {
        get { return parent.f9 }
        set { parent.f9 = newValue }
    }
    public var f10: Array<StructSimple?> {
        get { return parent.f10 }
        set { parent.f10 = newValue }
    }
}

public struct StructVector: StructVectorBase, Comparable, Hashable, Codable {
    public var f1: Array<UInt8> = Array()
    public var f2: Array<UInt8?> = Array()
    public var f3: Array<Data> = Array()
    public var f4: Array<Data?> = Array()
    public var f5: Array<EnumSimple> = Array()
    public var f6: Array<EnumSimple?> = Array()
    public var f7: Array<FlagsSimple> = Array()
    public var f8: Array<FlagsSimple?> = Array()
    public var f9: Array<StructSimple> = Array()
    public var f10: Array<StructSimple?> = Array()

    public init() { }
    public init(f1: Array<UInt8>, f2: Array<UInt8?>, f3: Array<Data>, f4: Array<Data?>, f5: Array<EnumSimple>, f6: Array<EnumSimple?>, f7: Array<FlagsSimple>, f8: Array<FlagsSimple?>, f9: Array<StructSimple>, f10: Array<StructSimple?>) {

        self.f1 = f1
        self.f2 = f2
        self.f3 = f3
        self.f4 = f4
        self.f5 = f5
        self.f6 = f6
        self.f7 = f7
        self.f8 = f8
        self.f9 = f9
        self.f10 = f10
    }

    public init(other: StructVector) {
        self.f1 = other.f1
        self.f2 = other.f2
        self.f3 = other.f3
        self.f4 = other.f4
        self.f5 = other.f5
        self.f6 = other.f6
        self.f7 = other.f7
        self.f8 = other.f8
        self.f9 = other.f9
        self.f10 = other.f10
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        f1 = try container.decode(Array<UInt8>.self, forKey: .f1)
        f2 = try container.decode(Array<UInt8?>.self, forKey: .f2)
        f3 = try container.decode(Array<Data>.self, forKey: .f3)
        f4 = try container.decode(Array<Data?>.self, forKey: .f4)
        f5 = try container.decode(Array<ChronoxorTest.EnumSimple>.self, forKey: .f5)
        f6 = try container.decode(Array<ChronoxorTest.EnumSimple?>.self, forKey: .f6)
        f7 = try container.decode(Array<ChronoxorTest.FlagsSimple>.self, forKey: .f7)
        f8 = try container.decode(Array<ChronoxorTest.FlagsSimple?>.self, forKey: .f8)
        f9 = try container.decode(Array<ChronoxorTest.StructSimple>.self, forKey: .f9)
        f10 = try container.decode(Array<ChronoxorTest.StructSimple?>.self, forKey: .f10)
    }

    public func clone() throws -> StructVector {
        // Serialize the struct to the FBE stream
        let writer = StructVectorModel()
        try _ = writer.serialize(value: self)

        // Deserialize the struct from the FBE stream
        let reader = StructVectorModel()
        reader.attach(buffer: writer.buffer)
        return reader.deserialize()
    }

    public static func < (lhs: StructVector, rhs: StructVector) -> Bool {
        return true
    }

    public static func == (lhs: StructVector, rhs: StructVector) -> Bool {
        return true
    }

    public func hash(into hasher: inout Hasher) {
    }

    public var description: String {
        var sb = String()
        sb.append("StructVector(")
        if true {
            var first = true
            sb.append("f1=["); sb.append("\(f1.count)"); sb.append("][")
            for item in f1 {
                sb.append(first ? "" : ","); sb.append(item.description)
                first = false
            }
            sb.append("]")
        }
        if true {
            var first = true
            sb.append(",f2=["); sb.append("\(f2.count)"); sb.append("][")
            for item in f2 {
                 if let item = item { sb.append(first ? "" : ","); sb.append(item.description) } else { sb.append(first ? "" : ","); sb.append("null") }
                first = false
            }
            sb.append("]")
        }
        if true {
            var first = true
            sb.append(",f3=["); sb.append("\(f3.count)"); sb.append("][")
            for item in f3 {
                sb.append(first ? "" : ","); sb.append("bytes["); sb.append("\(item.count)"); sb.append("]")
                first = false
            }
            sb.append("]")
        }
        if true {
            var first = true
            sb.append(",f4=["); sb.append("\(f4.count)"); sb.append("][")
            for item in f4 {
                 if let item = item { sb.append(first ? "" : ","); sb.append("bytes["); sb.append("\(item.count)"); sb.append("]") } else { sb.append(first ? "" : ","); sb.append("null") }
                first = false
            }
            sb.append("]")
        }
        if true {
            var first = true
            sb.append(",f5=["); sb.append("\(f5.count)"); sb.append("][")
            for item in f5 {
                sb.append(first ? "" : ","); sb.append(item.description)
                first = false
            }
            sb.append("]")
        }
        if true {
            var first = true
            sb.append(",f6=["); sb.append("\(f6.count)"); sb.append("][")
            for item in f6 {
                 if let item = item { sb.append(first ? "" : ","); sb.append(item.description) } else { sb.append(first ? "" : ","); sb.append("null") }
                first = false
            }
            sb.append("]")
        }
        if true {
            var first = true
            sb.append(",f7=["); sb.append("\(f7.count)"); sb.append("][")
            for item in f7 {
                sb.append(first ? "" : ","); sb.append(item.description)
                first = false
            }
            sb.append("]")
        }
        if true {
            var first = true
            sb.append(",f8=["); sb.append("\(f8.count)"); sb.append("][")
            for item in f8 {
                 if let item = item { sb.append(first ? "" : ","); sb.append(item.description) } else { sb.append(first ? "" : ","); sb.append("null") }
                first = false
            }
            sb.append("]")
        }
        if true {
            var first = true
            sb.append(",f9=["); sb.append("\(f9.count)"); sb.append("][")
            for item in f9 {
                sb.append(first ? "" : ","); sb.append(item.description)
                first = false
            }
            sb.append("]")
        }
        if true {
            var first = true
            sb.append(",f10=["); sb.append("\(f10.count)"); sb.append("][")
            for item in f10 {
                 if let item = item { sb.append(first ? "" : ","); sb.append(item.description) } else { sb.append(first ? "" : ","); sb.append("null") }
                first = false
            }
            sb.append("]")
        }
        sb.append(")")
        return sb
    }
    private enum CodingKeys: String, CodingKey {
        case f1
        case f2
        case f3
        case f4
        case f5
        case f6
        case f7
        case f8
        case f9
        case f10
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(f1, forKey: .f1)
        try container.encode(f2, forKey: .f2)
        try container.encode(f3, forKey: .f3)
        try container.encode(f4, forKey: .f4)
        try container.encode(f5, forKey: .f5)
        try container.encode(f6, forKey: .f6)
        try container.encode(f7, forKey: .f7)
        try container.encode(f8, forKey: .f8)
        try container.encode(f9, forKey: .f9)
        try container.encode(f10, forKey: .f10)
    }

    public func toJson() throws -> String {
        return String(data: try JSONEncoder().encode(self), encoding: .utf8)!
    }

    public static func fromJson(_ json: String) throws -> StructVector {
        return try JSONDecoder().decode(StructVector.self, from: json.data(using: .utf8)!)
    }
}
