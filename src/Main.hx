import luxe.GameConfig;
import luxe.Input;
import luxe.Sprite;
import luxe.Color;
import luxe.Vector;

class Main extends luxe.Game {
	typedef Message = {
		msg:String,
		time:Float,
		? event : String
	}
	var block:Sprite;
	var movementSpeed:Float = 2;

	override function config(config:GameConfig) {
		config.window.title = '2D-Game';

		config.window.width = 960;
		config.window.height = 640;
		config.window.fullscreen = false;
		return config;
	} // config

	override function ready() {
		block = new Sprite({
			name: 'block sprite',
			pos: Luxe.screen.mid,
			color: new Color().rgb(0xf94b04),
			size: new Vector(128, 128)
		});
		/*
			var text_size = Math.min(Math.round(Luxe.screen.h / 12), 48);

			text = new Text({
				pos: Luxe.screen.mid,
				point_size: text_size,
				depth: 3,
				align: TextAlign.center,
				font: montez_font,
				text: 'no message yet',
				color: new Color(0, 0, 0, 0).rgb(0x242424)
			});
		 */

		inputSetup();
	} // ready

	function inputSetup() {
		Luxe.input.bind_key('left', Key.left);
		Luxe.input.bind_key('left', Key.key_a);

		Luxe.input.bind_key('right', Key.right);
		Luxe.input.bind_key('right', Key.key_d);

		Luxe.input.bind_key('up', Key.up);
		Luxe.input.bind_key('up', Key.key_w);

		Luxe.input.bind_key('down', Key.down);
		Luxe.input.bind_key('down', Key.key_s);
	}

	override function onmousemove(event:MouseEvent) {
		// block.pos = event.pos;
	} // onmousemove

	override function onmousedown(e:MouseEvent) {
		/* trace(event.button);
		 * MouseEvent.button gives 1,2 or 3 back 1-[Leftclick] / 2-[MiddleMouseButtonClick] / 3-[Rightclick]
		 * MousEvent.state - These states are "InteractStates"
		 */
		block.pos.y = e.y;
		block.pos.x = e.x;
		if (e.button == 3) {
			text
		}
		if (e.state == InteractState.down) {}
		// block.pos = event.pos;
		trace(e.button);
	}

	override function onkeydown(e:KeyEvent) {
		// Dont need it
	}

	override function onkeyup(event:KeyEvent) {
		if (event.keycode == Key.escape) {
			Luxe.shutdown();
		}
	} // onkeyup

	override function update(delta:Float) {
		block.rotation_z += 40 * delta;
		movement();
	} // update

	function movement() {
		if (Luxe.input.inputdown('up')) {
			block.pos.y -= 1 * movementSpeed;
		}
		if (Luxe.input.inputdown('left')) {
			block.pos.x -= 1 * movementSpeed;
		}
		if (Luxe.input.inputdown('right')) {
			block.pos.x += 1 * movementSpeed;
		}
		if (Luxe.input.inputdown('down')) {
			block.pos.y += 1 * movementSpeed;
		}
	}
} // Main
