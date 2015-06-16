(function() {
    var game = new Phaser.Game(800, 600, Phaser.CANVAS, 'game', {
        preload: preload,
        create: create,
        update: update
    });

    function preload() {
        game.load.image('player', '/assets/player.png');
        game.load.image('grass', '/assets/grass.png');
    }

    function create() {
        this.grass = this.add.tileSprite(0, 0, this.world.width, this.world.height, 'grass');
        this.player = this.add.sprite(0, 0, 'player');
        this.player.scale.set(0.2, 0.2);
    }

    function update() {

    }
})();
