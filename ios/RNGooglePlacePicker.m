#import "RNGooglePlacePicker.h"
#import "RCTEventDispatcher.h"
#import <GooglePlaces/GooglePlaces.h>
#import <GooglePlacePicker/GooglePlacePicker.h>


@implementation RNGooglePlacePicker {
    GMSPlacePicker *_placePicker;
}

RCT_EXPORT_MODULE()

- (dispatch_queue_t)methodQueue {
    return dispatch_get_main_queue();
}

RCT_EXPORT_METHOD(show:
(RCTResponseSenderBlock) callback) {
    GMSPlacePickerConfig *config = [[GMSPlacePickerConfig alloc] initWithViewport:nil];
    _placePicker = [[GMSPlacePicker alloc] initWithConfig:config];
    [_placePicker pickPlaceWithCallback:^(GMSPlace *place, NSError *error) {
        if (place) {
            NSMutableDictionary *response = [[NSMutableDictionary alloc] init];
            if (place.formattedAddress) {
                [response setObject:place.formattedAddress forKey:@"address"];
            } else {
                [response setObject:[NSNull null] forKey:@"address"];
            }
			if (place.name) {
				[response setObject:place.name forKey:@"name"];
			} else {
				[response setObject:[NSNull null] forKey:@"name"];
			}
			if (place.placeID) {
				[response setObject:place.placeID forKey:@"google_id"];
			} else {
				[response setObject:[NSNull null] forKey:@"google_id"];
			}
            [response setObject:@(place.coordinate.latitude) forKey:@"latitude"];
            [response setObject:@(place.coordinate.longitude) forKey:@"longitude"];
            callback(@[response]);
        } else if (error) {
            callback(@[@{@"error" : error.localizedFailureReason}]);

        } else {
            callback(@[@{@"didCancel" : @YES}]);
        }
    }];

}


@end
