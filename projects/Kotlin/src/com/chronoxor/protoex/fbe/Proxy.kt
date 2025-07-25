//------------------------------------------------------------------------------
// Automatically generated by the Fast Binary Encoding compiler, do not modify!
// https://github.com/chronoxor/FastBinaryEncoding
// Source: protoex.fbe
// FBE version: 1.15.0.0
//------------------------------------------------------------------------------

@file:Suppress("UnusedImport", "unused")

package com.chronoxor.protoex.fbe

// Fast Binary Encoding com.chronoxor.protoex proxy
@Suppress("MemberVisibilityCanBePrivate", "PrivatePropertyName", "UNUSED_PARAMETER")
open class Proxy : com.chronoxor.fbe.Receiver, IProxyListener
{
    // Imported proxy
    var protoProxy: com.chronoxor.proto.fbe.Proxy

    // Proxy models accessors
    private val OrderMessageModel: OrderMessageModel
    private val BalanceMessageModel: BalanceMessageModel
    private val AccountMessageModel: AccountMessageModel

    constructor() : super(false)
    {
        protoProxy = com.chronoxor.proto.fbe.Proxy(buffer)
        OrderMessageModel = OrderMessageModel()
        BalanceMessageModel = BalanceMessageModel()
        AccountMessageModel = AccountMessageModel()
    }

    constructor(buffer: com.chronoxor.fbe.Buffer) : super(buffer, false)
    {
        protoProxy = com.chronoxor.proto.fbe.Proxy(buffer)
        OrderMessageModel = OrderMessageModel()
        BalanceMessageModel = BalanceMessageModel()
        AccountMessageModel = AccountMessageModel()
    }

    override fun onReceive(type: Long, buffer: ByteArray, offset: Long, size: Long): Boolean
    {
        return onReceiveListener(this, type, buffer, offset, size)
    }

    open fun onReceiveListener(listener: IProxyListener, type: Long, buffer: ByteArray, offset: Long, size: Long): Boolean
    {
        when (type)
        {
            com.chronoxor.protoex.fbe.OrderMessageModel.fbeTypeConst ->
            {
                // Attach the FBE stream to the proxy model
                OrderMessageModel.attach(buffer, offset)
                assert(OrderMessageModel.verify()) { "com.chronoxor.protoex.OrderMessage validation failed!" }

                val fbeBegin = OrderMessageModel.model.getBegin()
                if (fbeBegin == 0L)
                    return false
                // Call proxy handler
                listener.onProxy(OrderMessageModel, type, buffer, offset, size)
                OrderMessageModel.model.getEnd(fbeBegin)
                return true
            }
            com.chronoxor.protoex.fbe.BalanceMessageModel.fbeTypeConst ->
            {
                // Attach the FBE stream to the proxy model
                BalanceMessageModel.attach(buffer, offset)
                assert(BalanceMessageModel.verify()) { "com.chronoxor.protoex.BalanceMessage validation failed!" }

                val fbeBegin = BalanceMessageModel.model.getBegin()
                if (fbeBegin == 0L)
                    return false
                // Call proxy handler
                listener.onProxy(BalanceMessageModel, type, buffer, offset, size)
                BalanceMessageModel.model.getEnd(fbeBegin)
                return true
            }
            com.chronoxor.protoex.fbe.AccountMessageModel.fbeTypeConst ->
            {
                // Attach the FBE stream to the proxy model
                AccountMessageModel.attach(buffer, offset)
                assert(AccountMessageModel.verify()) { "com.chronoxor.protoex.AccountMessage validation failed!" }

                val fbeBegin = AccountMessageModel.model.getBegin()
                if (fbeBegin == 0L)
                    return false
                // Call proxy handler
                listener.onProxy(AccountMessageModel, type, buffer, offset, size)
                AccountMessageModel.model.getEnd(fbeBegin)
                return true
            }
        }

        if (protoProxy.onReceiveListener(listener, type, buffer, offset, size))
            return true

        return false
    }
}
