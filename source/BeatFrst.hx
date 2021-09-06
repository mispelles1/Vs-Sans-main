package;

import Controls.KeyboardScheme;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.util.FlxGradient;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.animation.FlxBaseAnimation;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import io.newgrounds.NG;
import lime.app.Application;
import flixel.addons.display.FlxBackdrop;
import flixel.util.FlxTimer;


class BeatFrst extends MusicBeatState
{
    var fredsText:FlxText;
    
    override function create()
    {
        fredsText = new FlxText(0, 0, 1300); // x, y, width
        fredsText.text = "Must beat Story mode first to unlock.\nPress Esc To Return.";
        fredsText.setFormat("assets/fonts/pixel.otf", 20, FlxColor.WHITE, CENTER);
        fredsText.setBorderStyle(OUTLINE, FlxColor.RED, 1);

        FlxG.switchState(new VideoState("assets/videos/tbc/tbc.webm", new MainMenuState()));
    }

}
