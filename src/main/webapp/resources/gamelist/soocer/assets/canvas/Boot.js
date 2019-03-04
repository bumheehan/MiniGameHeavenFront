
// -- user code here --

/* --- start generated code --- */

// Generated by  1.5.3 (Phaser v2.6.2)


/**
 * Boot.
 */
function Boot() {
	
	Phaser.State.call(this);
	
}

/** @type Phaser.State */
var Boot_proto = Object.create(Phaser.State.prototype);
Boot.prototype = Boot_proto;
Boot.prototype.constructor = Boot;

Boot.prototype.init = function () {
	
	this.scale.pageAlignHorizontally = true;
	this.scale.pageAlignVertically = true;

};

Boot.prototype.preload = function () {
	
	this.load.pack('img', 'assets/pack.json');
	this.load.pack('sound', 'assets/pack.json');
};

Boot.prototype.create = function () {
	
	startWhistle = this.game.add.audio('gameStart');
	endWhistle = this.game.add.audio('gameEnd');
	goal = this.game.add.audio('goal');
	kick = this.game.add.audio('kick');
	bgm1 = this.game.add.audio('bgm1');
	bgm2 = this.game.add.audio('bgm2');
	
	this.game.state.start("Menu");
};
/* --- end generated code --- */
// -- user code here --
