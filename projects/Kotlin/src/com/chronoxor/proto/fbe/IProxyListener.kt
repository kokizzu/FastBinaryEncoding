//------------------------------------------------------------------------------
// Automatically generated by the Fast Binary Encoding compiler, do not modify!
// https://github.com/chronoxor/FastBinaryEncoding
// Source: proto.fbe
// FBE version: 1.15.0.0
//------------------------------------------------------------------------------

@file:Suppress("UnusedImport", "unused")

package com.chronoxor.proto.fbe

// Fast Binary Encoding com.chronoxor.proto proxy listener interface
interface IProxyListener : com.chronoxor.fbe.IReceiverListener
{
    fun onProxy(model: OrderMessageModel, type: Long, buffer: ByteArray, offset: Long, size: Long) {}
    fun onProxy(model: BalanceMessageModel, type: Long, buffer: ByteArray, offset: Long, size: Long) {}
    fun onProxy(model: AccountMessageModel, type: Long, buffer: ByteArray, offset: Long, size: Long) {}
}
