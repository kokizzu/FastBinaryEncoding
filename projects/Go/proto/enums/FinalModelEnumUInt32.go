//------------------------------------------------------------------------------
// Automatically generated by the Fast Binary Encoding compiler, do not modify!
// https://github.com/chronoxor/FastBinaryEncoding
// Source: enums.fbe
// FBE version: 1.15.0.0
//------------------------------------------------------------------------------

package enums

import "errors"
import "../fbe"

// Fast Binary Encoding EnumUInt32 final model
type FinalModelEnumUInt32 struct {
    // Final model buffer
    buffer *fbe.Buffer
    // Final model buffer offset
    offset int
}

// Create a new EnumUInt32 final model
func NewFinalModelEnumUInt32(buffer *fbe.Buffer, offset int) *FinalModelEnumUInt32 {
    return &FinalModelEnumUInt32{buffer: buffer, offset: offset}
}

// Get the allocation size
func (fm *FinalModelEnumUInt32) FBEAllocationSize(value *EnumUInt32) int { return fm.FBESize() }

// Get the final size
func (fm *FinalModelEnumUInt32) FBESize() int { return 4 }

// Get the final offset
func (fm *FinalModelEnumUInt32) FBEOffset() int { return fm.offset }
// Set the final offset
func (fm *FinalModelEnumUInt32) SetFBEOffset(value int) { fm.offset = value }

// Shift the current final offset
func (fm *FinalModelEnumUInt32) FBEShift(size int) { fm.offset += size }
// Unshift the current final offset
func (fm *FinalModelEnumUInt32) FBEUnshift(size int) { fm.offset -= size }

// Check if the value is valid
func (fm *FinalModelEnumUInt32) Verify() int {
    if (fm.buffer.Offset() + fm.FBEOffset() + fm.FBESize()) > fm.buffer.Size() {
        return fbe.MaxInt
    }

    return fm.FBESize()
}

// Get the value
func (fm *FinalModelEnumUInt32) Get() (*EnumUInt32, int, error) {
    var value EnumUInt32
    size, err := fm.GetValueDefault(&value, EnumUInt32(0))
    return &value, size, err
}

// Get the value with provided default value
func (fm *FinalModelEnumUInt32) GetDefault(defaults EnumUInt32) (*EnumUInt32, int, error) {
    var value EnumUInt32
    size, err := fm.GetValueDefault(&value, defaults)
    return &value, size, err
}

// Get the value by the given pointer
func (fm *FinalModelEnumUInt32) GetValue(value *EnumUInt32) (int, error) {
    return fm.GetValueDefault(value, EnumUInt32(0))
}

// Get the value by the given pointer with provided default value
func (fm *FinalModelEnumUInt32) GetValueDefault(value *EnumUInt32, defaults EnumUInt32) (int, error) {
    if (fm.buffer.Offset() + fm.FBEOffset() + fm.FBESize()) > fm.buffer.Size() {
        *value = defaults
        return 0, errors.New("model is broken")
    }

    *value = EnumUInt32(fbe.ReadUInt32(fm.buffer.Data(), fm.buffer.Offset() + fm.FBEOffset()))
    return fm.FBESize(), nil
}

// Set the value by the given pointer
func (fm *FinalModelEnumUInt32) Set(value *EnumUInt32) (int, error) {
    return fm.SetValue(*value)
}

// Set the value
func (fm *FinalModelEnumUInt32) SetValue(value EnumUInt32) (int, error) {
    if (fm.buffer.Offset() + fm.FBEOffset() + fm.FBESize()) > fm.buffer.Size() {
        return 0, errors.New("model is broken")
    }

    fbe.WriteUInt32(fm.buffer.Data(), fm.buffer.Offset() + fm.FBEOffset(), uint32(value))
    return fm.FBESize(), nil
}
