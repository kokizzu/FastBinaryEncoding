//------------------------------------------------------------------------------
// Automatically generated by the Fast Binary Encoding compiler, do not modify!
// https://github.com/chronoxor/FastBinaryEncoding
// Source: FBE
// FBE version: 1.15.0.0
//------------------------------------------------------------------------------

package fbe

// Receive message interface
type OnReceive interface {
    OnReceive(fbeType int, buffer []byte) (bool, error)
}

// Receive message function
type OnReceiveFunc func(fbeType int, buffer []byte) (bool, error)
func (f OnReceiveFunc) OnReceive(fbeType int, buffer []byte) (bool, error) {
    return f(fbeType, buffer)
}

// Receive log message interface
type OnReceiveLog interface {
    OnReceiveLog(message string)
}

// Receive log message function
type OnReceiveLogFunc func(message string)
func (f OnReceiveLogFunc) OnReceiveLog(message string) {
    f(message)
}

// Fast Binary Encoding base receiver
type Receiver struct {
    // Receiver bytes buffer
    buffer *Buffer
    // Logging flag
    logging bool
    // Final protocol flag
    final bool

    // Receive message handler
    HandlerOnReceive OnReceive
    // Receive log message handler
    HandlerOnReceiveLog OnReceiveLog
}

// Create a new base receiver
func NewReceiver(buffer *Buffer, final bool) *Receiver {
    receiver := &Receiver{buffer: buffer, logging: false, final: final}
    receiver.SetupHandlerOnReceiveFunc(func(fbeType int, buffer []byte) (bool, error) { panic("receive handler is not provided") })
    receiver.SetupHandlerOnReceiveLogFunc(func(message string) {})
    return receiver
}

// Get the bytes buffer
func (r *Receiver) Buffer() *Buffer { return r.buffer }

// Get the final protocol flag
func (r *Receiver) Final() bool { return r.final }

// Get the logging flag
func (r *Receiver) Logging() bool { return r.logging }
// Set the logging flag
func (r *Receiver) SetLogging(logging bool) { r.logging = logging }

// Setup handlers
func (r *Receiver) SetupHandlers(handlers interface{}) {
    if handler, ok := handlers.(OnReceive); ok {
        r.SetupHandlerOnReceive(handler)
    }
    if handler, ok := handlers.(OnReceiveLog); ok {
        r.SetupHandlerOnReceiveLog(handler)
    }
}

// Setup receive message handler
func (r *Receiver) SetupHandlerOnReceive(handler OnReceive) { r.HandlerOnReceive = handler }
// Setup receive message handler function
func (r *Receiver) SetupHandlerOnReceiveFunc(function func(fbeType int, buffer []byte) (bool, error)) { r.HandlerOnReceive = OnReceiveFunc(function) }
// Setup receive log message handler
func (r *Receiver) SetupHandlerOnReceiveLog(handler OnReceiveLog) { r.HandlerOnReceiveLog = handler }
// Setup receive log message handler function
func (r *Receiver) SetupHandlerOnReceiveLogFunc(function func(message string)) { r.HandlerOnReceiveLog = OnReceiveLogFunc(function) }

// Reset the receiver buffer
func (r *Receiver) Reset() { r.buffer.Reset() }

// Receive bytes memory buffer
func (r *Receiver) Receive(buffer []byte) error {
    size := len(buffer)
    if size <= 0 {
        return nil
    }

    // Storage buffer
    offset0 := r.buffer.offset
    offset1 := r.buffer.size
    size1 := r.buffer.size

    // Receive buffer
    offset2 := 0
    size2 := size

    // While receive buffer is available to handle...
    for offset2 < size2 {
        var messageBuffer []byte = nil
        messageOffset := 0
        messageSize := 0

        // Try to receive message size
        messageSizeCopied := false
        messageSizeFound := false
        for !messageSizeFound {
            // Look into the storage buffer
            if offset0 < size1 {
                count := min(size1 - offset0, 4)
                if count == 4 {
                    messageSizeCopied = true
                    messageSizeFound = true
                    messageSize = int(ReadUInt32(r.buffer.data, r.buffer.offset + offset0))
                    offset0 += 4
                    break
                } else {
                    // Fill remaining data from the receive buffer
                    if offset2 < size2 {
                        count := min(size2 - offset2, 4 - count)

                        // Allocate and refresh the storage buffer
                        r.buffer.Allocate(count)
                        size1 += count

                        copy(r.buffer.data[offset1:offset1 + count], buffer[offset2:offset2 + count])

                        offset1 += count
                        offset2 += count
                        continue
                    } else {
                        break
                    }
                }
            }

            // Look into the receive buffer
            if offset2 < size2 {
                count := min(size2 - offset2, 4)
                if count == 4 {
                    messageSizeFound = true
                    messageSize = int(ReadUInt32(buffer, offset2))
                    offset2 += 4
                    break
                } else {
                    // Allocate and refresh the storage buffer
                    r.buffer.Allocate(count)
                    size1 += count

                    copy(r.buffer.data[offset1:offset1 + count], buffer[offset2:offset2 + count])
                    offset1 += count
                    offset2 += count
                    continue
                }
            } else {
                break
            }
        }

        if !messageSizeFound {
            return nil
        }

        // Check the message full size
        minSize := 4 + 4 + 4 + 4
        if r.final {
            minSize = 4 + 4
        }
        if messageSize < minSize {
            return nil
        }

        // Try to receive message body
        messageFound := false
        for !messageFound {
            // Look into the storage buffer
            if offset0 < size1 {
                count := min(size1 - offset0, messageSize - 4)
                if count == (messageSize - 4) {
                    messageFound = true
                    messageBuffer = r.buffer.data
                    messageOffset = offset0 - 4
                    offset0 += messageSize - 4
                    break
                } else {
                    // Fill remaining data from the receive buffer
                    if offset2 < size2 {
                        // Copy message size into the storage buffer
                        if !messageSizeCopied {
                            // Allocate and refresh the storage buffer
                            r.buffer.Allocate(4)
                            size1 += 4

                            WriteUInt32(r.buffer.data, r.buffer.offset + offset0, uint32(messageSize))
                            offset0 += 4
                            offset1 += 4

                            messageSizeCopied = true
                        }

                        count = min(size2 - offset2, messageSize - 4 - count)

                        // Allocate and refresh the storage buffer
                        r.buffer.Allocate(count)
                        size1 += count

                        copy(r.buffer.data[offset1:offset1 + count], buffer[offset2:offset2 + count])
                        offset1 += count
                        offset2 += count
                        continue
                    } else {
                        break
                    }
                }
            }

            // Look into the receive buffer
            if offset2 < size2 {
                count := min(size2 - offset2, messageSize - 4)
                if !messageSizeCopied && (count == (messageSize - 4)) {
                    messageFound = true
                    messageBuffer = buffer
                    messageOffset = offset2 - 4
                    offset2 += messageSize - 4
                    break
                } else {
                    // Copy message size into the storage buffer
                    if !messageSizeCopied {
                        // Allocate and refresh the storage buffer
                        r.buffer.Allocate(4)
                        size1 += 4

                        WriteUInt32(r.buffer.data, r.buffer.offset + offset0, uint32(messageSize))
                        offset0 += 4
                        offset1 += 4

                        messageSizeCopied = true
                    }

                    // Allocate and refresh the storage buffer
                    r.buffer.Allocate(count)
                    size1 += count

                    copy(r.buffer.data[offset1:offset1 + count], buffer[offset2:offset2 + count])
                    offset1 += count
                    offset2 += count
                    continue
                }
            } else {
                break
            }
        }

        if !messageFound {
            // Copy message size into the storage buffer
            if !messageSizeCopied {
                // Allocate and refresh the storage buffer
                r.buffer.Allocate(4)
                size1 += 4

                WriteUInt32(r.buffer.data, r.buffer.offset + offset0, uint32(messageSize))
                offset0 += 4
                offset1 += 4

                messageSizeCopied = true
            }
            return nil
        }

        // Read the message parameters
        var fbeStructSize = 0
        var fbeStructType = 0
        if r.final {
            fbeStructSize = int(ReadUInt32(messageBuffer, messageOffset))
            fbeStructType = int(ReadUInt32(messageBuffer, messageOffset + 4))
        } else {
            fbeStructOffset := int(ReadUInt32(messageBuffer, messageOffset + 4))
            fbeStructSize = int(ReadUInt32(messageBuffer, messageOffset + fbeStructOffset))
            fbeStructType = int(ReadUInt32(messageBuffer, messageOffset + fbeStructOffset+ 4))
        }
        _ = fbeStructSize

        // Handle the message
        if _, err := r.HandlerOnReceive.OnReceive(fbeStructType, messageBuffer[messageOffset:messageOffset + messageSize]); err != nil {
            return err
        }

        // Reset the storage buffer
        r.buffer.Reset()

        // Refresh the storage buffer
        offset0 = r.buffer.offset
        offset1 = r.buffer.size
        size1 = r.buffer.size
    }
    return nil
}

// Receive buffer
func (r *Receiver) ReceiveBuffer(buffer *Buffer) error {
    return r.Receive(buffer.data)
}

// Min utility function
func min(a, b int) int {
    if a < b {
        return a
    }
    return b
}
