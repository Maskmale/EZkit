

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (EZItem)


+ (UIBarButtonItem *)EZ_itemWithimage:(UIImage *)image
                  highlightedImage:(UIImage *)highlightedImage
                            target:(id)target
                            action:(SEL)action;

+ (UIBarButtonItem *)EZ_itemWithimage:(UIImage *)image
                     selectedImage:(UIImage *)selectedImage
                            target:(id)target
                            action:(SEL)action;

+ (UIBarButtonItem *)EZ_backItemWithimage:(UIImage *)image
                      highlightedImage:(UIImage *)highlightedImage
                                target:(id)target action:(SEL)action
                                 title:(NSString *)title;


@end
