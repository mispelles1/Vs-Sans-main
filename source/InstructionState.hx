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

class InstructionState extends MusicBeatState
{
    var boobaWarn:FlxSprite;

    override function create()
    {
        if (FlxG.sound.music.playing)   
        {
            FlxG.sound.playMusic(Paths.music('instructionMenu'), 0);

            FlxG.sound.music.fadeIn(4, 0, 0.7);
        }

        transIn = FlxTransitionableState.defaultTransIn;
        transOut = FlxTransitionableState.defaultTransOut;

        boobaWarn = new FlxSprite().loadGraphic(Paths.image('controls_menu'));
		boobaWarn.screenCenter();
		add(boobaWarn);
    }

    override function update(elapsed:Float)
    {
        if (controls.ACCEPT)
        {
            FlxG.switchState(new MainMenuState());
            FlxG.sound.music.fadeIn(0, 0, -0.7);
        }
        super.update(elapsed);
    }
}