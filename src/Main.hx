package;
import hxPixels.Pixels;
import folder.Folder;
import hxRectPack2D.pixels.Helper;
import hxRectPack2D.atlas.BodyBuilder;
import hxRectPack2D.output.BodyFrames;
import hxRectPack2D.output.LimbFrame;
import hxRectPack2D.rectangle.XYWHF;
import hxRectPack2D.folder.Files;
class Main {
    var inputAtlas       = 'dragon_bodyparts.png';
    var inputJson        = 'dragon_bodyparts.json';
    var blocks           = new Array<XYWHF>();
    var names            = new Array<String>();
    var inputLimbs       : Array<LimbFrame>;
    var inputPixels      : Pixels;
    var bodyFrames:      BodyFrames;
    var images           = new Array<Pixels>();
    var atlasFiles:      Files;
    var folderFiles:     Files;
    var extractFiles:    Files;
    public static function main() { new Main(); } public function new(){
        extractFiles = new Files( { directory:    'assets/'
                                , subDirectory:   'extractOut'
                                , json:           'dragonSquash_Atlas.json'
                                , atlas:          'dragonSquash.png'
                                } );
        atlasFiles = new Files( { directory:      'assets/'
                                , subDirectory:   'rectPack'
                                , json:           'dragonSquash_Atlas.json'
                                , atlas:          'dragonSquash.png'
                                } );
        folderFiles = new Files( { directory:     'assetsZebra/'
                                , subDirectory:   'rectPack'
                                , json:           'zebra_Atlas.json'
                                , atlas:          'zebraAtlas.png'
                                } );
        extractAtlas();
        rebuildAtlas();
        resetArrays();
        inputFolder();
    }
    function resetArrays(){
        blocks = new Array<XYWHF>();
        names  = new Array<String>();
    }
    function extractAtlas(){
        inputPixels  = extractFiles.getPixels( inputAtlas );
        inputLimbs   = extractFiles.getBodyFrame( inputJson ).limbs;
        atlasToImages( inputPixels, inputLimbs );
    }
    function rebuildAtlas(){
        inputPixels  = atlasFiles.getPixels( inputAtlas );
        inputLimbs   = atlasFiles.getBodyFrame( inputJson ).limbs;
        generateAtlasBlocks( inputPixels, inputLimbs );
        createAtlas( 1024, atlasFiles, atlasToAtlas );
    }
    function inputFolder(){
        var arrImgSpecs = folderFiles.getImages();
        generateFolderBlocks( arrImgSpecs );
        createAtlas( 300, folderFiles, toAtlas );
    }
    function generateFolderBlocks( arrImgSpecs: Array<ImageSpec> ){
        var spec: ImageSpec;
        var len = arrImgSpecs.length;
        var pixels: Pixels;
        for( i in 0...len ){ 
            spec        = arrImgSpecs[ i ];
            pixels      = spec.pixels;
            images[ i ] = pixels;
            names[ i ]  = spec.fileSpec.name;
            blocks[ i ] = new XYWHF( i, 0, 0, pixels.width, pixels.height );
        }
    }
    function generateAtlasBlocks( pixels: Pixels, limbs: Array<LimbFrame> ){
        var i = 0;
        for( limb in limbs ){
            names[  i ]  = limb.name;
            blocks[ i ]  = new XYWHF( i, 0, 0, Std.int( limb.w ), Std.int( limb.h ) );
            i++;
        }
    }
    function createAtlas( height: Int, files: Files, render: BodyFrames->Int->Int->Pixels ){
        var bodyBuilder = new BodyBuilder();
        var width = bodyBuilder.generatePackingData( names, blocks, height );
        bodyBuilder.build( files.outputImagePath() );
        files.saveAtlas( 
            render( bodyBuilder.bodyFrames, width, height )
          , bodyBuilder.jsonString 
        );
    }
    function toAtlas( bodyFrame: BodyFrames, width: Int, height: Int ): Pixels {
        var pixels   = new Pixels( width, height, true );
        var limbGen: LimbFrame;
        var _        = Std.int;
        var byName   = bodyFrame.limbByName;
        var draw     = Helper.drawImage32;
        var drawCW   = Helper.drawImage32ClockWise;
        for( i in 0...names.length ){
            limbGen = byName( names[ i ] );
            if( limbGen.flipped ){
                drawCW( 0, 0, _( limbGen.x ), _( limbGen.y ), images[ i ], pixels );
            } else {
                draw( 0, 0, _( limbGen.x ), _( limbGen.y ), images[ i ], pixels );
            }
        }
        return pixels;
    }
    function atlasToImages( inputPixels: Pixels, limbs: Array<LimbFrame> ){
        extractFiles.rebuildDirectory();
        var pixels:  Pixels;
        var _        = Std.int;
        var draw     = Helper.drawImage32_wh;
        var drawAnti = Helper.drawImage32AntiClockWise_wh;
        for( limb in limbs ){
            pixels = new Pixels( _( limb.w ), _( limb.h ), true );
            if( limb.flipped ){
                drawAnti(  _( limb.x ),  _( limb.y )
                         , _( limb.w ),  _( limb.h )
                         , 0, 0
                         , inputPixels,    pixels );
            } else {
                draw(      _( limb.x ),  _( limb.y )
                         , _( limb.w ),  _( limb.h )
                         , 0, 0
                         , inputPixels,    pixels );
            }
            extractFiles.savePixels( pixels, limb.name.split('.')[0] + '.png' );
        }
    }
    function atlasToAtlas( bodyFrame: BodyFrames, width: Int, height: Int ): Pixels {
        var pixels = new Pixels( width, height, true );
        var limbIn:  LimbFrame;
        var limbGen: LimbFrame;
        var _        = Std.int;
        var byName   = bodyFrame.limbByName;
        var draw     = Helper.drawImage32_wh;
        var drawCW   = Helper.drawImage32ClockWise_wh;
        var drawAnti = Helper.drawImage32AntiClockWise_wh;
        for( i in 0...names.length ){
            limbGen = byName( names[ i ] );
            limbIn = inputLimbs[ i ];
            if( limbGen.flipped ){
                if( limbIn.flipped ){
                    draw(     _( limbIn.x ),  _( limbIn.y )
                            , _( limbIn.w ),  _( limbIn.h )
                            , _( limbGen.x ), _( limbGen.y )
                            , inputPixels,    pixels );
                } else {
                    drawCW(   _( limbIn.x ),  _( limbIn.y )
                            , _( limbIn.w ),  _( limbIn.h )
                            , _( limbGen.x ), _( limbGen.y )
                            , inputPixels,    pixels );
                }
            } else {
                if( limbGen.flipped ){
                    drawAnti( _( limbIn.x ),  _( limbIn.y )
                            , _( limbIn.w ),  _( limbIn.h )
                            , _( limbGen.x ), _( limbGen.y )
                            , inputPixels,    pixels );
                } else {
                    draw(     _( limbIn.x ),  _( limbIn.y )
                            , _( limbIn.w ),  _( limbIn.h )
                            , _( limbGen.x ), _( limbGen.y )
                            , inputPixels,    pixels );
                }
            }
        }
        return pixels;
    }
}
