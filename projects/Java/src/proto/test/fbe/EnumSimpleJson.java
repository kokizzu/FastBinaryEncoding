// Automatically generated by the Fast Binary Encoding compiler, do not modify!
// https://github.com/chronoxor/FastBinaryEncoding

package test;

import java.io.*;
import java.lang.*;
import java.lang.reflect.*;
import java.math.*;
import java.nio.charset.*;
import java.time.*;
import java.util.*;
import fbe.*;
import proto.*;

import com.google.gson.*;

public final class EnumSimpleJson implements JsonSerializer<EnumSimple>, JsonDeserializer<EnumSimple>
{
    @Override
    public JsonElement serialize(EnumSimple src, Type typeOfSrc, JsonSerializationContext context)
    {
        return new JsonPrimitive(src.getRaw());
    }

    @Override
    public EnumSimple deserialize(JsonElement json, Type type, JsonDeserializationContext context) throws JsonParseException
    {
        return new EnumSimple(json.getAsJsonPrimitive().getAsInt());
    }
}