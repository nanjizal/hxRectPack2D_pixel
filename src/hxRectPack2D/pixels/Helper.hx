package hxRectPack2D.pixels;
import hxPixels.Pixels;
class Helper {
    public inline static
    function drawImage32( fx: Int, fy: Int, tx: Int, ty: Int
                        , fromPixels: Pixels, toPixels: Pixels ){
        var w = fromPixels.width;
        var h = fromPixels.height;
        for( x in 0...w ){
            for( y in 0...h ){
                toPixels.setPixel32( tx + x, ty + y, fromPixels.getPixel32( fx + x, fy + y ) );
            }
        }
    }
    public inline static 
    function drawImage( fx: Int, fy: Int, tx: Int, ty: Int
                      , fromPixels: Pixels, toPixels: Pixels ){
    var w = fromPixels.width;
    var h = fromPixels.height;
    for( x in 0...w ){
       for( y in 0...h ){
                toPixels.setPixel( tx + x, ty + y, fromPixels.getPixel( fx + x, fy + y ) );
            }
        }
    }
    public inline static  // standard flipped 
    function drawImage32ClockWise( fx: Int, fy: Int, tx: Int, ty: Int
                                 , fromPixels: Pixels, toPixels: Pixels ){
        var w = fromPixels.width;
        var h = fromPixels.height;
        for( x in 0...w ){ for( y in 0...h ){
                                //    concept for 3x3 pixels
                                //
                                //    a b c         g d a
                                //    d e f    ->   h e b
                                //    g h i         i f c
                toPixels.setPixel32( tx + h - y, ty + x, fromPixels.getPixel32( fx + x, fy + y ) );
            }
        }
    }
    public inline static
    function drawImage32AntiClockWise( fx: Int, fy: Int, tx: Int, ty: Int
                                     , fromPixels: Pixels, toPixels: Pixels ){
        var w = fromPixels.width;
        var h = fromPixels.height;
        for( x in 0...w ){ for( y in 0...h ){
                                //    concepts for 3x3 pixels
                                //    a b c         c f i
                                //    d e f    ->   b e f
                                //    g h i         a d g
                toPixels.setPixel32( tx + h - y, ty + w - x, fromPixels.getPixel32( fx + x, fy + y ) );
            }
        }
    }
    public inline static  // standard flipped 
    function drawImageClockWise( fx: Int, fy: Int, tx: Int, ty: Int
                                 , fromPixels: Pixels, toPixels: Pixels ){
        var w = fromPixels.width;
        var h = fromPixels.height;
        for( x in 0...w ){ for( y in 0...h ){
                                //    concept for 3x3 pixels
                                //
                                //    a b c         g d a
                                //    d e f    ->   h e b
                                //    g h i         i f c
                toPixels.setPixel( tx + h - y, ty + x, fromPixels.getPixel( fx + x, fy + y ) );
            }
        }
    }
    public inline static
    function drawImageAntiClockWise( fx: Int, fy: Int, tx: Int, ty: Int
                                     , fromPixels: Pixels, toPixels: Pixels ){
        var w = fromPixels.width;
        var h = fromPixels.height;
        for( x in 0...w ){ for( y in 0...h ){
                                //    concepts for 3x3 pixels
                                //    a b c         c f i
                                //    d e f    ->   b e f
                                //    g h i         a d g
                toPixels.setPixel( tx + h - y, ty + w - x, fromPixels.getPixel( fx + x, fy + y ) );
            }
        }
    }
    public inline static
    function drawImage32_180( fx: Int, fy: Int, tx: Int, ty: Int
                                 , fromPixels: Pixels, toPixels: Pixels ){
        var w = fromPixels.width;
        var h = fromPixels.height;
        for( x in 0...w ){ for( y in 0...h ){
                                //    concept for 3x3 pixels
                                //
                                //    a b c         i h g
                                //    d e f    ->   f e d
                                //    g h i         c b a
                toPixels.setPixel32( tx + w - x, ty + h - y, fromPixels.getPixel32( fx + x, fy + y ) );
            }
        }
    }
    public inline static
    function drawImage_180( fx: Int, fy: Int, tx: Int, ty: Int
                            , fromPixels: Pixels, toPixels: Pixels ){
        var w = fromPixels.width;
        var h = fromPixels.height;
        for( x in 0...w ){ for( y in 0...h ){
                                //    concepts for 3x3 pixels
                                //    a b c         i h g
                                //    d e f    ->   f e d
                                //    g h i         c b a
                toPixels.setPixel( tx + w - x, ty + h - y, fromPixels.getPixel( fx + x, fy + y ) );
            }
        }
    }
    
    //**************************************//
    //                                      //
    //  When you want to only do a subset   //
    //                                      //
    //**************************************//
    public inline static
    function drawImage32_wh( fx: Int, fy: Int, fw: Int, fh: Int
                        , tx: Int, ty: Int
                        , fromPixels: Pixels, toPixels: Pixels ){
        var w = fw;
        var h = fh;
        for( x in 0...w ){
            for( y in 0...h ){
                toPixels.setPixel32( tx + x, ty + y, fromPixels.getPixel32( fx + x, fy + y ) );
            }
        }
    }
    public inline static 
    function drawImage_wh( fx: Int, fy: Int, fw: Int, fh: Int
                        , tx: Int, ty: Int
                        , fromPixels: Pixels, toPixels: Pixels ){
        var w = fw;
        var h = fh;
    for( x in 0...w ){
       for( y in 0...h ){
                toPixels.setPixel( tx + x, ty + y, fromPixels.getPixel( fx + x, fy + y ) );
            }
        }
    }
    public inline static  // standard flipped 
    function drawImage32ClockWise_wh( fx: Int, fy: Int, fw: Int, fh: Int
                                    , tx: Int, ty: Int
                                    , fromPixels: Pixels, toPixels: Pixels ){
        var w = fw;
        var h = fh;
        for( x in 0...w ){ for( y in 0...h ){
                                //    concept for 3x3 pixels
                                //
                                //    a b c         g d a
                                //    d e f    ->   h e b
                                //    g h i         i f c
                toPixels.setPixel32( tx + h - y, ty + x, fromPixels.getPixel32( fx + x, fy + y ) );
            }
        }
    }
    public inline static
    function drawImage32AntiClockWise_wh( fx: Int, fy: Int, fw: Int, fh: Int
                                    , tx: Int, ty: Int
                                    , fromPixels: Pixels, toPixels: Pixels ){
        var w = fw;
        var h = fh;
        for( x in 0...w ){ for( y in 0...h ){
                                //    concepts for 3x3 pixels
                                //    a b c         c f i
                                //    d e f    ->   b e f
                                //    g h i         a d g
                toPixels.setPixel32( tx + h - y, ty + w - x, fromPixels.getPixel32( fx + x, fy + y ) );
            }
        }
    }
    public inline static  // standard flipped 
    function drawImageClockWise_wh( fx: Int, fy: Int, fw: Int, fh: Int
                                 , tx: Int, ty: Int
                                 , fromPixels: Pixels, toPixels: Pixels ){
        var w = fw;
        var h = fh;
        for( x in 0...w ){ for( y in 0...h ){
                                //    concept for 3x3 pixels
                                //
                                //    a b c         g d a
                                //    d e f    ->   h e b
                                //    g h i         i f c
                toPixels.setPixel( tx + h - y, ty + x, fromPixels.getPixel( fx + x, fy + y ) );
            }
        }
    }
    public inline static
    function drawImageAntiClockWise_wh( fx: Int, fy: Int, fw: Int, fh: Int
                                      , tx: Int, ty: Int
                                      , fromPixels: Pixels, toPixels: Pixels ){
        var w = fw;
        var h = fh;
        for( x in 0...w ){ for( y in 0...h ){
                                //    concepts for 3x3 pixels
                                //    a b c         c f i
                                //    d e f    ->   b e f
                                //    g h i         a d g
                toPixels.setPixel( tx + h - y, ty + w - x, fromPixels.getPixel( fx + x, fy + y ) );
            }
        }
    }
    public inline static
    function drawImage32_180_wh( fx: Int, fy: Int, fw: Int, fh: Int
                               , tx: Int, ty: Int
                               , fromPixels: Pixels, toPixels: Pixels ){
        var w = fw;
        var h = fh;
        for( x in 0...w ){ for( y in 0...h ){
                                //    concept for 3x3 pixels
                                //
                                //    a b c         i h g
                                //    d e f    ->   f e d
                                //    g h i         c b a
                toPixels.setPixel32( tx + w - x, ty + h - y, fromPixels.getPixel32( fx + x, fy + y ) );
            }
        }
    }
    public inline static
    function drawImage_180_wh( fx: Int, fy: Int, fw: Int, fh: Int
                             , tx: Int, ty: Int
                             , fromPixels: Pixels, toPixels: Pixels ){
        var w = fw;
        var h = fh;
        for( x in 0...w ){ for( y in 0...h ){
                                //    concepts for 3x3 pixels
                                //    a b c         i h g
                                //    d e f    ->   f e d
                                //    g h i         c b a
                toPixels.setPixel( tx + w - x, ty + h - y, fromPixels.getPixel( fx + x, fy + y ) );
            }
        }
    }
}