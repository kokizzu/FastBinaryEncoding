package benchmarks

import java.util.*
import org.openjdk.jmh.annotations.*

@Suppress("MemberVisibilityCanBePrivate")
internal class MySender1 : com.chronoxor.proto.fbe.Sender()
{
    var size: Long = 0
        private set
    var logSize: Long = 0
        private set

    override fun onSend(buffer: ByteArray, offset: Long, size: Long): Long
    {
        this.size += size
        return size
    }

    override fun onSendLog(message: String)
    {
        logSize += message.length.toLong()
    }
}

@Suppress("MemberVisibilityCanBePrivate")
internal class MySender2 : com.chronoxor.proto.fbe.Sender()
{
    var size: Long = 0
        private set
    var logSize: Long = 0
        private set

    override fun onSend(buffer: ByteArray, offset: Long, size: Long): Long
    {
        this.size += size
        return 0
    }

    override fun onSendLog(message: String)
    {
        logSize += message.length.toLong()
    }
}

@Suppress("MemberVisibilityCanBePrivate")
internal class MyReceiver : com.chronoxor.proto.fbe.Receiver()
{
    var logSize: Long = 0
        private set

    override fun onReceive(value: com.chronoxor.proto.OrderMessage) {}
    override fun onReceive(value: com.chronoxor.proto.BalanceMessage) {}
    override fun onReceive(value: com.chronoxor.proto.AccountMessage) {}

    override fun onReceiveLog(message: String)
    {
        logSize += message.length.toLong()
    }
}

@State(Scope.Benchmark)
class BenchmarkSendReceive
{
    @Suppress("JoinDeclarationAndAssignment")
    private val _account: com.chronoxor.proto.AccountMessage
    private val _sender1: MySender1
    private val _sender2: MySender2
    private val _receiver: MyReceiver

    init
    {
        // Create a new account with some orders
        _account = com.chronoxor.proto.AccountMessage(com.chronoxor.proto.Account(1, "Test", com.chronoxor.proto.State.good, com.chronoxor.proto.Balance("USD", 1000.0), com.chronoxor.proto.Balance("EUR", 100.0), ArrayList()))
        _account.body.orders.add(com.chronoxor.proto.Order(1, "EURUSD", com.chronoxor.proto.OrderSide.buy, com.chronoxor.proto.OrderType.market, 1.23456, 1000.0))
        _account.body.orders.add(com.chronoxor.proto.Order(2, "EURUSD", com.chronoxor.proto.OrderSide.sell, com.chronoxor.proto.OrderType.limit, 1.0, 100.0))
        _account.body.orders.add(com.chronoxor.proto.Order(3, "EURUSD", com.chronoxor.proto.OrderSide.buy, com.chronoxor.proto.OrderType.stop, 1.5, 10.0))

        _sender1 = MySender1()
        _sender1.send(_account)

        _sender2 = MySender2()
        _sender2.send(_account)

        _receiver = MyReceiver()
        _receiver.receive(_sender2.buffer)
    }

    @Benchmark
    @BenchmarkMode(Mode.Throughput)
    fun send()
    {
        // Serialize and send the account
        _sender1.send(_account)
    }
    /*
    @Benchmark
    @BenchmarkMode(Mode.Throughput)
    fun sendWithLogs()
    {
        // Enable logging
        _sender1.logging = true

        // Serialize and send the account
        _sender1.send(_account)
    }
    */
    @Benchmark
    @BenchmarkMode(Mode.Throughput)
    fun receive()
    {
        // Receive the account from the sender
        _receiver.receive(_sender2.buffer)
    }
    /*
    @Benchmark
    @BenchmarkMode(Mode.Throughput)
    fun receiveWithLogs()
    {
        // Enable logging
        _receiver.logging = true

        // Receive the account from the sender
        _receiver.receive(_sender2.buffer)
    }
    */
}
