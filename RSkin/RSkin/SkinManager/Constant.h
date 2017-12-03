//
//  Constant.h
//  ListController
//
//  Created by rui on 2017/6/9.
//  Copyright © 2017年 rui. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NSString* SkinModeType;

typedef enum {
    SkinModeDay,
    SkinModeNight,
    SkinModeLight
}SkinMode;

#define SkinChangingNotification @"SkinChangingNotification"
#define SkinStateKey  @"SkinStateKey"
#define SeparatedString @"|"

#define SET_BACKGROUNDCOLOR @"setBackgroundColor:"
#define SET_BORDERCOLOR @"setBorderColor:"

#define SET_IMAGE @"setImage:"

#define SET_CONTENTS @"setContents:"

#define SET_SELECTEDIMAGE @"setSelectedImage:"

#define SET_BACKGROUNDIMAGE_FORSTATE @"setBackgroundImage:forState:"
#define SET_IMAGE_FORSTATE @"setImage:forState:"

#define SET_COLOR_FORSTATE @"setTitleColor:forState:"

#define SET_NAV_BACKGROUNDIMANGE_FORSTATE @"setBackgroundImage:forBarMetrics:"

#define SET_TITLE_ATTRIBUTES_FORSTATE @"setTitleTextAttributes:forState:"

#define SET_TITLE_ATTRIBUTES @"setTitleTextAttributes:"

#define SET_TEXT_COLOR @"setTextColor:"

#define SET_FILL_COLOR @"setFillColor:"

#define SET_STROKE_COLOR @"setStrokeColor:"

#define SET_SEPARATOR_COLOR @"setSeparatorColor:"

#define SET_STATUSBARSTYLE @"setStatusBarStyle:"

#define SET_TEXTFILEDPLACEHOLDERCOLOR @"setTextFiledPlaceholderColor:"
