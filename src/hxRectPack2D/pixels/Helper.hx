package hxRectPack2D.pixels;
import hxPixels.Pixels;
class Helper {
    public inline static
    function drawImage32( tx: Int, ty: Int, fx: Int, fy: Int
                        , toPixels: Pixels, fromPixels: Pixels ){
        var w = fromPixels.width;
        var h = fromPixels.height;
        for( x in 0...w ){
            for( y in 0...h ){
                toPixels.setPixel32( fx + x, fy + y, fromPixels.getPixel32( tx + x, ty + y ) );
            }
        }
    }
    public inline static 
    function drawImage( tx: Int, ty: Int, fx: Int, fy: Int
                      , toPixels: Pixels, fromPixels: Pixels ){
    var w = fromPixels.width;
    var h = fromPixels.height;
    for( x in 0...w ){
       for( y in 0...h ){
                toPixels.setPixel( fx + x, fy + y, fromPixels.getPixel( tx + x, ty + y ) );
            }
        }
    }
    public inline static  // standard flipped 
    function drawImage32ClockWise( tx: Int, ty: Int, fx: Int, fy: Int
                                 , toPixels: Pixels, fromPixels: Pixels ){
        var w = fromPixels.width;
        var h = fromPixels.height;
        for( x in 0...w ){ for( y in 0...h ){
                                //    concept for 3x3 pixels
                                //
                                //    a b c         g d a
                                //    d e f    ->   h e b
                                //    g h i         i f c
                toPixels.setPixel32( fx + h - y, fy + x, fromPixels.getPixel32( tx + x, ty + y ) );
            }
        }
    }
    public inline static
    function drawImage32AntiClockWise( tx: Int, ty: Int, fx: Int, fy: Int
                                     , toPixels: Pixels, fromPixels: Pixels ){
        var w = fromPixels.width;
        var h = fromPixels.height;
        for( x in 0...w ){ for( y in 0...h ){
                                //    concepts for 3x3 pixels
                                //    a b c         c f i
                                //    d e f    ->   b e f
                                //    g h i         a d g
                toPixels.setPixel32( fx + h - y, fy + w - x, fromPixels.getPixel32( tx + x, ty + y ) );
            }
        }
    }
    public inline static  // standard flipped 
    function drawImageClockWise( tx: Int, ty: Int, fx: Int, fy: Int
                                 , toPixels: Pixels, fromPixels: Pixels ){
        var w = fromPixels.width;
        var h = fromPixels.height;
        for( x in 0...w ){ for( y in 0...h ){
                                //    concept for 3x3 pixels
                                //
                                //    a b c         g d a
                                //    d e f    ->   h e b
                                //    g h i         i f c
                toPixels.setPixel( fx + h - y, fy + x, fromPixels.getPixel( tx + x, ty + y ) );
            }
        }
    }
    public inline static
    function drawImageAntiClockWise( tx: Int, ty: Int, fx: Int, fy: Int
                                     , toPixels: Pixels, fromPixels: Pixels ){
        var w = fromPixels.width;
        var h = fromPixels.height;
        for( x in 0...w ){ for( y in 0...h ){
                                //    concepts for 3x3 pixels
                                //    a b c         c f i
                                //    d e f    ->   b e f
                                //    g h i         a d g
                toPixels.setPixel( fx + h - y, fy + w - x, fromPixels.getPixel( tx + x, ty + y ) );
            }
        }
    }
}