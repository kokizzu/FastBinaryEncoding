//------------------------------------------------------------------------------
// Automatically generated by the Fast Binary Encoding compiler, do not modify!
// https://github.com/chronoxor/FastBinaryEncoding
// Source: protoex.fbe
// FBE version: 1.15.0.0
//------------------------------------------------------------------------------

import ChronoxorFbe

// Fast Binary Encoding StateEx field model
public class FieldModelStateEx: FieldModel {

    public var _buffer: Buffer = Buffer()
    public var _offset: Int = 0

    public var fbeSize: Int = 1

    public required init() {
        _buffer = Buffer()
        _offset = 0
    }

    // Get the value
    public func get(defaults: StateEx = StateEx()) -> StateEx {
        if _buffer.offset + fbeOffset + fbeSize > _buffer.size {
            return defaults
        }

        return StateEx(value: readByte(offset: fbeOffset))
    }

    // Set the value
    public func set(value: StateEx) throws {
        if (_buffer.offset + fbeOffset + fbeSize) > _buffer.size {
            assertionFailure("Model is broken!")
            return
        }

        write(offset: fbeOffset, value: value.raw)
    }
}
