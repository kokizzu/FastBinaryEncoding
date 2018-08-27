// Automatically generated by the Fast Binary Encoding compiler, do not modify!
// https://github.com/chronoxor/FastBinaryEncoding

class UUID {
  constructor (value = null) {
    if (typeof value === 'string' || value instanceof String) {
      value = value.replace(/[{}-]/g, '')
      this.data = new Uint8Array(16)
      for (let i = 0; i < value.length; i += 1) { this.data[i] = parseInt(value.substr(i * 2, 2), 16) }
    } else if (value instanceof Uint8Array) {
      this.data = value
    } else if (value instanceof UUID) {
      this.data = value.data
    } else {
      this.data = new Uint8Array(16)
    }
  }

  toString () {
    let hex = []
    for (let i = 0; i < this.data.length; i++) {
      hex.push((this.data[i] >>> 4).toString(16))
      hex.push((this.data[i] & 0xF).toString(16))
      if (i === 3 || i === 5 || i === 7 || i === 9) hex.push('-')
    }
    return hex.join('')
  }

  static nil () {
    return new UUID()
  }

  WriteUInt32 (offset, value) {
    this.data[offset + 3] = (value >>> 24)
    this.data[offset + 2] = (value >>> 16)
    this.data[offset + 1] = (value >>> 8)
    this.data[offset + 0] = (value & 0xFF)
  }
  WriteUInt16 (offset, value) {
    this.data[offset + 1] = (value >>> 8)
    this.data[offset + 0] = (value & 0xFF)
  }
  WriteUInt8 (offset, value) {
    this.data[offset + 0] = (value & 0xFF)
  }

  fromParts (timeLow, timeMid, timeHiAndVersion, clockSeqHiAndReserved, clockSeqLow, nodeLow, nodeMid, nodeHi) {
    this.WriteUInt32(0, timeLow)
    this.WriteUInt16(4, timeMid)
    this.WriteUInt16(6, timeHiAndVersion)
    this.WriteUInt8(8, clockSeqHiAndReserved)
    this.WriteUInt8(9, clockSeqLow)
    this.WriteUInt32(10, nodeLow)
    this.WriteUInt8(14, nodeMid)
    this.WriteUInt8(15, nodeHi)
  };

  static sequential () {
    let now = new Date().getTime()
    let sequence = Math.floor(Math.random() * TWO_POW_14)
    let nodeHi = (Math.floor(Math.random() * TWO_POW_8) | 1)
    let nodeMid = Math.floor(Math.random() * TWO_POW_8)
    let nodeLow = Math.floor(Math.random() * TWO_POW_32)
    let tick = Math.floor(Math.random() * TWO_POW_4)
    let timestamp = 0
    let timestampRatio = 1 / 4

    if (now !== timestamp) {
      if (now < timestamp) {
        sequence++
      }
      timestamp = now
      tick = Math.floor(Math.random() * TWO_POW_4)
    } else if (Math.random() < timestampRatio && tick < 9984) {
      tick += 1 + Math.floor(Math.random() * TWO_POW_4)
    } else {
      sequence++
    }

    let ts = timestamp - Date.UTC(1582, 9, 15)
    let hm = ((ts / 0x100000000) * 10000) & 0xFFFFFFF
    let tl = ((ts & 0xFFFFFFF) * 10000) % 0x100000000 + tick
    let thav = (hm >>> 16 & 0xFFF) | 0x1000

    sequence &= 0x3FFF
    let cshar = (sequence >>> 8) | 0x80
    let csl = sequence & 0xFF

    let uuid = new UUID()
    uuid.fromParts(tl, hm & 0xFFFF, thav, cshar, csl, nodeLow, nodeMid, nodeHi)
    return uuid
  }

  static random () {
    let uuid = new UUID()
    uuid.fromParts(
      Math.floor(Math.random() * TWO_POW_32),
      Math.floor(Math.random() * TWO_POW_16),
      0x4000 | Math.floor(Math.random() * TWO_POW_12),
      0x80 | Math.floor(Math.random() * TWO_POW_6),
      Math.floor(Math.random() * TWO_POW_8),
      Math.floor(Math.random() * TWO_POW_32),
      Math.floor(Math.random() * TWO_POW_8),
      Math.floor(Math.random() * TWO_POW_8)
    )
    return uuid
  }

  eq (other) {
    let equal = true
    for (let i = 0; i < 16; i++) {
      if (this.data[i] !== other.data[i]) {
        equal = false
        break
      }
    }
    return equal
  }

  ne (other) {
    return !this.eq(other)
  }

  lt (other) {
    return this.cmp(other) < 0
  }

  lte (other) {
    return this.cmp(other) <= 0
  }

  gt (other) {
    return this.cmp(other) > 0
  }

  gte (other) {
    return this.cmp(other) >= 0
  }

  cmp (other) {
    for (let i = 0; i < 16; i++) {
      if (this.data[i] > other.data[i]) return 1
      if (this.data[i] < other.data[i]) return -1
    }
    return 0
  }
}

Object.defineProperty(UUID.prototype, '__isUUID__', {value: true})

const TWO_POW_32 = 4294967296
const TWO_POW_16 = 65536
const TWO_POW_14 = 16384
const TWO_POW_12 = 4096
const TWO_POW_8 = 256
const TWO_POW_6 = 64
const TWO_POW_4 = 16

exports.UUID = UUID
