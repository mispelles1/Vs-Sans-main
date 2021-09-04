package;

import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxGradient;
import flixel.FlxObject;
import flixel.tweens.FlxEase;
import flixel.addons.display.FlxBackdrop;
import flixel.tweens.FlxTween;
import lime.utils.Assets;
import flixel.addons.transition.FlxTransitionableState;


#if windows
import Discord.DiscordClient;
#end

using StringTools;

class CreditState extends MusicBeatState
{

    override public function create()
    {
        transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

        if (FlxG.sound.music != null)
            {
                if (!FlxG.sound.music.playing)
                    FlxG.sound.playMusic(Paths.music('freakyMenu'));
            }

        if (controls.BACK)
        {
            FlxG.switchState(new MainMenuState());
        }
        var gradientBar:FlxSprite = new FlxSprite(0,0).makeGraphic(FlxG.width, 300, 0xFFAA00AA);
        add(gradientBar);

        var txt:FlxText = new FlxText(0, 0, FlxG.width,
			"New Shit for ME ENGINE!!"
            + "\n\nTeam Leader:"
            + "\nX The Asshole"
            + "\n\nProgrammer:"
            + "\nMispelles"
            + "\n\nMusicians:"
            + "\nIronik"
            + "\nMispelles"
            + "\nSilkwyrm"
            + "\n\nCharters:"
            + "\nMispelles"
            + "\nItzJax"
            + "\nbenjatrueno"
            + "\n\nArtist:"
            + "\nAmelia"
            + "\nX The Asshole"
            + "\nChikety"
            + "\n\nAnimators/Cutscene Animators:"
            + "\nAmelia"
            + "\nX The Asshole"
            + "\nDiego arrozconlimas"
			+ "\n\nPress BACKSPACE To Return To The Main Menu\nOr stay and look lol",
			6);
		
		txt.setFormat("VCR OSD Mono", 26, FlxColor.fromRGB(200, 200, 200), CENTER);
		txt.borderColor = FlxColor.BLUE;
		txt.borderSize = 1;
		txt.borderStyle = FlxTextBorderStyle.OUTLINE;
		txt.screenCenter();
		add(txt);
    }

    override function update(elapsed:Float)
    {
        if (controls.BACK)
        {
            FlxG.switchState(new MainMenuState());
        }
    }
}