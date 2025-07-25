//------------------------------------------------------------------------------
// Automatically generated by the Fast Binary Encoding compiler, do not modify!
// https://github.com/chronoxor/FastBinaryEncoding
// Source: FBE
// FBE version: 1.15.0.0
//------------------------------------------------------------------------------

import Foundation

// Fast Binary Encoding bytes field model
public class FieldModelData: FieldModel {
    public var _buffer = Buffer()
    public var _offset: Int = 0

    // Field size
    public let fbeSize: Int = 4

    public required init() {
        _buffer = Buffer()
        _offset = 0
    }

    // Field extra size
    public var fbeExtra: Int {
        if (_buffer.offset + fbeOffset + fbeSize) > _buffer.size {
            return 0
        }

        let fbeBytesOffset = Int(readUInt32(offset: fbeOffset))
        if (fbeBytesOffset == 0) || ((_buffer.offset + fbeBytesOffset + 4) > _buffer.size) {
            return 0
        }

        let fbeBytesSize = Int(readUInt32(offset: fbeBytesOffset))
        return 4 + fbeBytesSize
    }

    public func verify() -> Bool {
        if (_buffer.offset + fbeOffset + fbeSize) > _buffer.size {
            return true
        }

        let fbeBytesOffset = Int(readUInt32(offset: fbeOffset))
        if fbeBytesOffset == 0 {
            return true
        }

        if (_buffer.offset + fbeBytesOffset + 4) > _buffer.size {
            return false
        }

        let fbeBytesSize = Int(readUInt32(offset: fbeBytesOffset))
        if (_buffer.offset + fbeBytesOffset + 4 + fbeBytesSize) > _buffer.size {
            return false
        }

        return true
    }

    // Get the value
    public func get(defaults: Data = Data(count: 0)) -> Data {
        if (_buffer.offset + fbeOffset + fbeSize) > _buffer.size {
            return defaults
        }

        let fbeBytesOffset = Int(readUInt32(offset: fbeOffset))
        if fbeBytesOffset == 0 {
            return defaults
        }

        if _buffer.offset + fbeBytesOffset + 4 > _buffer.size {
            assertionFailure("Model is broken!")
            return defaults
        }

        let fbeBytesSize = Int(readUInt32(offset: fbeBytesOffset))
        if _buffer.offset + fbeBytesOffset + 4 + fbeBytesSize > _buffer.size {
            assertionFailure("Model is broken!")
            return defaults
        }

        return readBytes(offset: fbeBytesOffset + 4, size: fbeBytesSize)
    }

    // Set the value
    public func set(value: Data) throws {
        if _buffer.offset + fbeOffset + fbeSize > _buffer.size {
            assertionFailure("Model is broken!")
            return
        }

        let fbeBytesSize = value.count
        let fbeBytesOffset = try _buffer.allocate(size: 4 + fbeBytesSize) - _buffer.offset
        if fbeBytesOffset <= 0 || (_buffer.offset + fbeBytesOffset + 4 + fbeBytesSize) > _buffer.size {
            assertionFailure("Model is broken!")
            return
        }

        write(offset: fbeOffset, value: UInt32(fbeBytesOffset))
        write(offset: fbeBytesOffset, value: UInt32(fbeBytesSize))
        write(offset: fbeBytesOffset + 4, value: value)
    }
}
