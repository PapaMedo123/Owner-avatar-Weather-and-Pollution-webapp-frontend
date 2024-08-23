# openapi.api.BaseCityApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiCityAllGet**](BaseCityApi.md#apicityallget) | **GET** /api/city/all | 
[**apiCityNearestGet**](BaseCityApi.md#apicitynearestget) | **GET** /api/city/nearest | 


# **apiCityAllGet**
> List<City> apiCityAllGet()



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = BaseCityApi();

try {
    final result = api_instance.apiCityAllGet();
    print(result);
} catch (e) {
    print('Exception when calling BaseCityApi->apiCityAllGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<City>**](City.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiCityNearestGet**
> StationDto apiCityNearestGet(longitude, latitude)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = BaseCityApi();
final longitude = 1.2; // double | 
final latitude = 1.2; // double | 

try {
    final result = api_instance.apiCityNearestGet(longitude, latitude);
    print(result);
} catch (e) {
    print('Exception when calling BaseCityApi->apiCityNearestGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **longitude** | **double**|  | [optional] 
 **latitude** | **double**|  | [optional] 

### Return type

[**StationDto**](StationDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

