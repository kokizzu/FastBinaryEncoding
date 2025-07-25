//------------------------------------------------------------------------------
// Automatically generated by the Fast Binary Encoding compiler, do not modify!
// https://github.com/chronoxor/FastBinaryEncoding
// Source: FBE
// FBE version: 1.15.0.0
//------------------------------------------------------------------------------

package fbe

import "errors"

// Fast Binary Encoding bytes final model
type FinalModelBytes struct {
    // Final model buffer
    buffer *Buffer
    // Final model buffer offset
    offset int
}

// Create a new bytes final model
func NewFinalModelBytes(buffer *Buffer, offset int) *FinalModelBytes {
    return &FinalModelBytes{buffer: buffer, offset: offset}
}

// Get the allocation size
func (fm *FinalModelBytes) FBEAllocationSize(value []byte) int { return 4 + len(value) }

// Get the final offset
func (fm *FinalModelBytes) FBEOffset() int { return fm.offset }
// Set the final offset
func (fm *FinalModelBytes) SetFBEOffset(value int) { fm.offset = value }

// Shift the current final offset
func (fm *FinalModelBytes) FBEShift(size int) { fm.offset += size }
// Unshift the current final offset
func (fm *FinalModelBytes) FBEUnshift(size int) { fm.offset -= size }

// Check if the bytes value is valid
func (fm *FinalModelBytes) Verify() int {
    if (fm.buffer.Offset() + fm.FBEOffset() + 4) > fm.buffer.Size() {
        return MaxInt
    }

    fbeBytesSize := int(ReadUInt32(fm.buffer.Data(), fm.buffer.Offset() + fm.FBEOffset()))
    if (fm.buffer.Offset() + fm.FBEOffset() + 4 + fbeBytesSize) > fm.buffer.Size() {
        return MaxInt
    }

    return 4 + fbeBytesSize
}

// Get the bytes value
func (fm *FinalModelBytes) Get() ([]byte, int, error) {
    if (fm.buffer.Offset() + fm.FBEOffset() + 4) > fm.buffer.Size() {
        return make([]byte, 0), 0, nil
    }

    fbeBytesSize := int(ReadUInt32(fm.buffer.Data(), fm.buffer.Offset() + fm.FBEOffset()))
    if (fm.buffer.Offset() + fm.FBEOffset() + 4 + fbeBytesSize) > fm.buffer.Size() {
        return make([]byte, 0), 4, errors.New("model is broken")
    }

    return ReadBytes(fm.buffer.Data(), fm.buffer.Offset() + fm.FBEOffset() + 4, fbeBytesSize), 4 + fbeBytesSize, nil
}

// Set the bytes value
func (fm *FinalModelBytes) Set(value []byte) (int, error) {
    if (fm.buffer.Offset() + fm.FBEOffset() + 4) > fm.buffer.Size() {
        return 0, errors.New("model is broken")
    }

    fbeBytesSize := len(value)
    if (fm.buffer.Offset() + fm.FBEOffset() + 4 + fbeBytesSize) > fm.buffer.Size() {
        return 4, errors.New("model is broken")
    }

    WriteUInt32(fm.buffer.Data(), fm.buffer.Offset() + fm.FBEOffset(), uint32(fbeBytesSize))
    WriteBytes(fm.buffer.Data(), fm.buffer.Offset() + fm.FBEOffset() + 4, value)
    return 4 + fbeBytesSize, nil
}
