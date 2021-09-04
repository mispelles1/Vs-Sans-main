package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;

class OutdatedSubState extends MusicBeatState
{
	public static var leftState:Bool = false;

	public static var needVer:String = "IDFK LOL";
	public static var currChanges:String = "dk";
	
	private var bgColors:Array<String> = [
		'#314d7f',
		'#4e7093',
		'#70526e',
		'#594465'
	];
	private var colorRotation:Int = 1;

	override function create()
	{
		super.create();
		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('week54prototype', 'shared'));
		bg.scale.x *= 1.55;
		bg.scale.y *= 1.55;
		bg.screenCenter();
		add(bg);
		
		var mispellesLogo:FlxSprite = new FlxSprite(FlxG.width, 0).loadGraphic(Paths.image('MispellesEngineLogo'));
		mispellesLogo.scale.y = 0.3;
		mispellesLogo.scale.x = 0.3;
		mispellesLogo.x -= mispellesLogo.frameHeight;
		mispellesLogo.y -= 180;
		mispellesLogo.alpha = 0.8;
		add(mispellesLogo);
		
		var txt:FlxText = new FlxText(0, 0, FlxG.width,
			"New Shit for ME ENGINE!!"
			+ MainMenuState.mispellesEngineVer
			+ "\nGo read the ChangeLog.md in the files or on the github!"
			+ "\nIf you experience bugs please let me know on my GitHub or Twitter @mispelles"
			+ "\n\nPress Space to view the Change Log site\nor ESCAPE to ignore this",
			32);
		
		txt.setFormat("VCR OSD Mono", 32, FlxColor.fromRGB(200, 200, 200), CENTER);
		txt.borderColor = FlxColor.BLACK;
		txt.borderSize = 3;
		txt.borderStyle = FlxTextBorderStyle.OUTLINE;
		txt.screenCenter();
		add(txt);
		
		FlxTween.color(bg, 2, bg.color, FlxColor.fromString(bgColors[colorRotation]));
		FlxTween.angle(mispellesLogo, mispellesLogo.angle, -10, 2, {ease: FlxEase.quartInOut});
		
		new FlxTimer().start(2, function(tmr:FlxTimer)
		{
			FlxTween.color(bg, 2, bg.color, FlxColor.fromString(bgColors[colorRotation]));
			if(colorRotation < (bgColors.length - 1)) colorRotation++;
			else colorRotation = 0;
		}, 0);
		
		new FlxTimer().start(2, function(tmr:FlxTimer)
		{
			if(mispellesLogo.angle == -10) FlxTween.angle(mispellesLogo, mispellesLogo.angle, 10, 2, {ease: FlxEase.quartInOut});
			else FlxTween.angle(mispellesLogo, mispellesLogo.angle, -10, 2, {ease: FlxEase.quartInOut});
		}, 0);
		
		new FlxTimer().start(0.8, function(tmr:FlxTimer)
		{
			if(mispellesLogo.alpha == 0.8) FlxTween.tween(mispellesLogo, {alpha: 1}, 0.8, {ease: FlxEase.quartInOut});
			else FlxTween.tween(mispellesLogo, {alpha: 0.8}, 0.8, {ease: FlxEase.quartInOut});
		}, 0);
	}

	override function update(elapsed:Float)
	{
		if (controls.ACCEPT)
		{
			fancyOpenURL("https://github.com/mispelles1/MispellesEngine/blob/Changelog/ChangeLog.md");
		}
		if (controls.BACK)
		{
			leftState = true;
			FlxG.switchState(new MainMenuState());
		}
		super.update(elapsed);
	}
}
