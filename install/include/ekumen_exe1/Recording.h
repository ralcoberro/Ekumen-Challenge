// Generated by gencpp from file ekumen_exe1/Recording.msg
// DO NOT EDIT!


#ifndef EKUMEN_EXE1_MESSAGE_RECORDING_H
#define EKUMEN_EXE1_MESSAGE_RECORDING_H

#include <ros/service_traits.h>


#include <ekumen_exe1/RecordingRequest.h>
#include <ekumen_exe1/RecordingResponse.h>


namespace ekumen_exe1
{

struct Recording
{

typedef RecordingRequest Request;
typedef RecordingResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct Recording
} // namespace ekumen_exe1


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::ekumen_exe1::Recording > {
  static const char* value()
  {
    return "694091dc244da4b236b12351f9f53c99";
  }

  static const char* value(const ::ekumen_exe1::Recording&) { return value(); }
};

template<>
struct DataType< ::ekumen_exe1::Recording > {
  static const char* value()
  {
    return "ekumen_exe1/Recording";
  }

  static const char* value(const ::ekumen_exe1::Recording&) { return value(); }
};


// service_traits::MD5Sum< ::ekumen_exe1::RecordingRequest> should match 
// service_traits::MD5Sum< ::ekumen_exe1::Recording > 
template<>
struct MD5Sum< ::ekumen_exe1::RecordingRequest>
{
  static const char* value()
  {
    return MD5Sum< ::ekumen_exe1::Recording >::value();
  }
  static const char* value(const ::ekumen_exe1::RecordingRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::ekumen_exe1::RecordingRequest> should match 
// service_traits::DataType< ::ekumen_exe1::Recording > 
template<>
struct DataType< ::ekumen_exe1::RecordingRequest>
{
  static const char* value()
  {
    return DataType< ::ekumen_exe1::Recording >::value();
  }
  static const char* value(const ::ekumen_exe1::RecordingRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::ekumen_exe1::RecordingResponse> should match 
// service_traits::MD5Sum< ::ekumen_exe1::Recording > 
template<>
struct MD5Sum< ::ekumen_exe1::RecordingResponse>
{
  static const char* value()
  {
    return MD5Sum< ::ekumen_exe1::Recording >::value();
  }
  static const char* value(const ::ekumen_exe1::RecordingResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::ekumen_exe1::RecordingResponse> should match 
// service_traits::DataType< ::ekumen_exe1::Recording > 
template<>
struct DataType< ::ekumen_exe1::RecordingResponse>
{
  static const char* value()
  {
    return DataType< ::ekumen_exe1::Recording >::value();
  }
  static const char* value(const ::ekumen_exe1::RecordingResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // EKUMEN_EXE1_MESSAGE_RECORDING_H