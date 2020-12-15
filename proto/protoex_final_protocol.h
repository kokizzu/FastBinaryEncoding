// Automatically generated by the Fast Binary Encoding compiler, do not modify!
// https://github.com/chronoxor/FastBinaryEncoding
// Source: protoex.fbe
// Version: 1.5.0.0

#pragma once

#if defined(__clang__)
#pragma clang system_header
#elif defined(__GNUC__)
#pragma GCC system_header
#elif defined(_MSC_VER)
#pragma system_header
#endif

#include "fbe_protocol.h"

#include "protoex_final_models.h"

#include "proto_final_protocol.h"

namespace FBE {

namespace protoex {

// Fast Binary Encoding protoex protocol version
struct ProtocolVersion
{
    // Protocol major version
    static const int major = 1;
    // Protocol minor version
    static const int minor = 0;
};

// Fast Binary Encoding protoex final sender
class FinalSender : public virtual FBE::Sender
    , public virtual proto::FinalSender
{
public:
    FinalSender()
        : OrderMessageModel(this->_buffer)
        , BalanceMessageModel(this->_buffer)
        , AccountMessageModel(this->_buffer)
    { this->final(true); }
    FinalSender(const FinalSender&) = delete;
    FinalSender(FinalSender&&) noexcept = default;
    virtual ~FinalSender() = default;

    FinalSender& operator=(const FinalSender&) = delete;
    FinalSender& operator=(FinalSender&&) noexcept = default;

    // Imported senders
    proto::FinalSender& proto_sender() noexcept { return *this; }

    size_t send(const ::protoex::OrderMessage& value);
    size_t send(const ::protoex::BalanceMessage& value);
    size_t send(const ::protoex::AccountMessage& value);

public:
    // Sender models accessors
    FBE::protoex::OrderMessageFinalModel OrderMessageModel;
    FBE::protoex::BalanceMessageFinalModel BalanceMessageModel;
    FBE::protoex::AccountMessageFinalModel AccountMessageModel;
};

// Fast Binary Encoding protoex final receiver
class FinalReceiver : public virtual FBE::Receiver
    , public virtual proto::FinalReceiver
{
public:
    FinalReceiver() { this->final(true); }
    FinalReceiver(const FinalReceiver&) = delete;
    FinalReceiver(FinalReceiver&&) = default;
    virtual ~FinalReceiver() = default;

    FinalReceiver& operator=(const FinalReceiver&) = delete;
    FinalReceiver& operator=(FinalReceiver&&) = default;

protected:
    // Receive handlers
    virtual void onReceive(const ::protoex::OrderMessage& value) {}
    virtual void onReceive(const ::protoex::BalanceMessage& value) {}
    virtual void onReceive(const ::protoex::AccountMessage& value) {}

    // Receive message handler
    bool onReceive(size_t type, const void* data, size_t size) override;

private:
    // Receiver values accessors
    ::protoex::OrderMessage OrderMessageValue;
    ::protoex::BalanceMessage BalanceMessageValue;
    ::protoex::AccountMessage AccountMessageValue;

    // Receiver models accessors
    FBE::protoex::OrderMessageFinalModel OrderMessageModel;
    FBE::protoex::BalanceMessageFinalModel BalanceMessageModel;
    FBE::protoex::AccountMessageFinalModel AccountMessageModel;
};

// Fast Binary Encoding protoex final client
class FinalClient : public virtual FinalSender, protected virtual FinalReceiver
    , public virtual proto::FinalClient
{
public:
    typedef proto::FinalClient protoFinalClient;

    FinalClient() = default;
    FinalClient(const FinalClient&) = delete;
    FinalClient(FinalClient&&) = default;
    virtual ~FinalClient() = default;

    FinalClient& operator=(const FinalClient&) = delete;
    FinalClient& operator=(FinalClient&&) = default;

    // Imported clients
    proto::FinalClient& proto_client() noexcept { return *this; }

    // Reset client buffers
    void reset() { std::scoped_lock locker(this->_lock); reset_requests(); }

    // Watchdog for timeouts
    void watchdog(uint64_t utc) { std::scoped_lock locker(this->_lock); watchdog_requests(utc); }


protected:
    virtual bool onReceiveResponse(const ::protoex::OrderMessage& response) { return false; }
    virtual bool onReceiveResponse(const ::protoex::BalanceMessage& response) { return false; }
    virtual bool onReceiveResponse(const ::protoex::AccountMessage& response) { return false; }

    virtual bool onReceiveReject(const ::protoex::OrderMessage& reject) { return false; }
    virtual bool onReceiveReject(const ::protoex::BalanceMessage& reject) { return false; }
    virtual bool onReceiveReject(const ::protoex::AccountMessage& reject) { return false; }

    virtual void onReceiveNotify(const ::protoex::OrderMessage& notify) {}
    virtual void onReceiveNotify(const ::protoex::BalanceMessage& notify) {}
    virtual void onReceiveNotify(const ::protoex::AccountMessage& notify) {}

    virtual void onReceive(const ::protoex::OrderMessage& value) override { if (!onReceiveResponse(value) && !onReceiveReject(value)) onReceiveNotify(value); }
    virtual void onReceive(const ::protoex::BalanceMessage& value) override { if (!onReceiveResponse(value) && !onReceiveReject(value)) onReceiveNotify(value); }
    virtual void onReceive(const ::protoex::AccountMessage& value) override { if (!onReceiveResponse(value) && !onReceiveReject(value)) onReceiveNotify(value); }

    // Reset client requests
    virtual void reset_requests();

    // Watchdog client requests for timeouts
    virtual void watchdog_requests(uint64_t utc);
};

} // namespace protoex

} // namespace FBE
