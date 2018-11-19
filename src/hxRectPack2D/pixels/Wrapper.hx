package hxRectPack2D.pixels;
import hxRectPack2D.pixels.Helper;
import hxPixels.Pixels;
class Wrapper {
    public var pixels: Pixels;
    public var width:  Int;
    public var height: Int;
    public function new( pixels_: Pixels ){
        pixels = pixels_;
        width  = pixels.width;
        height = pixels.height;
    }
    public function dimensions(){
        return { width: width, height: height };
    }
    public inline
    function draw( fx: Int, fy: Int, fromImg: Wrapper ): Void {
        Helper.drawImage32( 0, 0, fx, fy, pixels, fromImg.pixels );
    }
    public inline // standard flipped 
    function drawCW( fx: Int, fy: Int, fromImg: Wrapper ): Void {
        Helper.drawImage32ClockWise( 0, 0, fx, fy, pixels, fromImg.pixels );
    }
    public inline // extract flipped
    function drawACW( fx: Int, fy: Int, fromImg: Wrapper ): Void {
        Helper.drawImage32AntiClockWise( 0, 0, fx, fy, pixels, fromImg.pixels );
    }
}
