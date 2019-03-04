import GamePlay from './number.js'; 

class SceneA extends Phaser.Scene {
    
    
    
    
        
            constructor ()
            {
                super({ key: 'sceneA', 
                        pack: {
                        files: [
                            {
                                type: 'image',
                                key: 'image01',
                                url: 'zenvalogo.png'
                            }
                        ]
                    }
                      
                      });
                
                
            }

            preload ()
            {
               
                this.load.atlas('exImgs', 'spritearray.png', 'spritearray.json');
                this.add.image(400, 300, 'image01');
//                this.add.image(100, 0, 'image01').setOrigin(0);
                var progressBar = this.add.graphics();
            var progressBox = this.add.graphics();
            var width = this.cameras.main.width;
            var height = this.cameras.main.height;
            var loadingText = this.make.text({
                x: width / 2,
                y: height / 2 - 50,
                text: 'Loading...',
                style: {
                    font: '20px monospace',
                    fill: '#ffffff'
                }
            });
            var percentText = this.make.text({
                x: width / 2,
                y: height / 2 - 5,
                text: '0%',
                style: {
                    font: '18px monospace',
                    fill: '#ffffff'
                }
            });
            var assetText = this.make.text({
                x: width / 2,
                y: height / 2 + 50,
                text: '',
                style: {
                    font: '18px monospace',
                    fill: '#ffffff'
                }
            });
            assetText.setOrigin(0.5, 0.5);
            percentText.setOrigin(0.5, 0.5);
            loadingText.setOrigin(0.5, 0.5);
            progressBox.fillStyle(0x222222, 0.8);
            progressBox.fillRect(240, 270, 320, 50);
            this.load.image('logo', 'zenvalogo.png');
                
                var g = GamePlay.gamePlay;
                
            
                        for (var i = 0; i < 1; i++) {
                this.load.image('logo'+i, 'zenvalogo.png');
            }
//            start();
                
                
            this.load.on('progress', function (value) {
            console.log(value);
                
            percentText.setText(parseInt(value * 100) + '%');
            progressBar.clear();
            progressBar.fillStyle(0xffffff, 1);
            progressBar.fillRect(250, 280, 300 * value, 30);
            });

            this.load.on('fileprogress', function (file) {
                console.log(file.src);
                	
//                assetText.setText('Loading asset: ' + file.key);
                assetText.setText('Loading asset: ' + file.src);
            });

            this.load.on('complete', function () {
                console.log('complete');
                progressBar.destroy();
                progressBox.destroy();
                loadingText.destroy();
                percentText.destroy();
                assetText.destroy();
            });
            }

            create ()
            {
//               var logo = this.add.image(400, 300, 'image01');
                var timedEvent = this.time.delayedCall(1000, function(){
                    this.scene.start('GamePlay');
                }, [], this);
                
            }
//            function start(){
//            alert("start");
//                        for (var i = 0; i < 150; i++) {
//                SceneA.load.image('logo'+i, '../zenvalogo.png');
//            }
            
        }
            
        
        
        export default SceneA;