// Automatically generated by the Fast Binary Encoding compiler, do not modify!
// https://github.com/chronoxor/FastBinaryEncoding
// Source: test.fbe
// Version: 1.5.0.0

package com.chronoxor.test;

public enum EnumEmptyEnum
{
    ;

    private int value;

    EnumEmptyEnum(int value) { this.value = (int)value; }
    EnumEmptyEnum(EnumEmptyEnum value) { this.value = value.value; }

    public int getRaw() { return value; }

    public static EnumEmptyEnum mapValue(int value) { return mapping.get(value); }

    @Override
    public String toString()
    {
        return "<empty>";
    }

    private static final java.util.Map<Integer, EnumEmptyEnum> mapping = new java.util.HashMap<>();
    static
    {
        for (var value : EnumEmptyEnum.values())
            mapping.put(value.value, value);
    }
}
