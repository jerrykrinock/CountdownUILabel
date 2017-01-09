The problem is to use a UILabel to make a "counter" or "timer" type of display, wherein the digits will remain in fixed positions and not jump horizontally as different digits with various glyph widths are displayed.

UIKit provides a nice solution to this, the special font returned by `UIFont.monospacedDigitSystemFont(ofSize:weight:)`.  But this font is not available in the Attributes Inspector of Interface Builder.  The conventional solution to this problem is to replace the font set in Interface Builder with the special font, in ViewController.viewDidLoad().  We do that in Demo 1.  This works OK when run in an iPad but the font size of 300 is too big for the iPhone 5.

The conventional solution to the size problem is to, in Interface Builder, open the Attributes Inspector for the UILabel, click the tiny "+" button to the left of the "Font" field and add a so-called *customization*, in this case, a smaller font for the smaller size classes.  In Demo 2, we have done that, setting a font size of of 120.0 for horizontal-compact size classes, leaving it at 300.0 for other size classes.  But, lo, this does not work as expected as you can see by running the demo.  The digits in Demo 2 jump around.  The reason for this is that, apparently, **the fonts assigned per size class in Interface Builder are done *after* -viewDidLoad()**.  Therefore, we get the original system font set in Interface Builder, not the special `monospacedDigitSystemFont` we want.  This behavior is odd ane unexpected, because normally all parameters in are read from the nib and set *before* -viewDidLoad(), so you can change whatever you want in -viewDidLoad()..

To make it work, we must therefore go back to only one font set in Interface Builder, and then in -viewDidLoad(), assign the special font of the size which is appropriate for the current size class.  We do this in Demo 3.  As you can see in running the demo, Demo 3 works as desired in either horizontal size class.  That is, you can set the Scheme to either iPad or iPhone SE, for example.