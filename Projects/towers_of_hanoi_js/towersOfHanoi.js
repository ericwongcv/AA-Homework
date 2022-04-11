class Game {
    constructor()   {
        this.towers = [ [1, 2, 3], [], [] ];
    }

    promptMove(reader, callback) {
        console.log(this.towers);

        let startTowerIdx, endTowerIdx;

        reader.question('From which rod do you want to pick up? (0, 1, or 2): ', (ans) => {
            startTowerIdx = parseInt(ans);
            // console.log(startTowerIdx);

            reader.question('Which rod do you want to place your piece on? (0, 1, or 2): ', (ans) => {
                endTowerIdx = parseInt(ans);
                // console.log(endTowerIdx);

                callback(startTowerIdx, endTowerIdx);
            });
        });
    };

    isValidMove(startTowerIdx, endTowerIdx) {
        const startTower = this.towers[startTowerIdx];
        const endTower = this.towers[endTowerIdx];
  
        if (startTower.length === 0) {
          return false;
        } else if (endTower.length == 0) {
          return true;
        } else {
          const topStartDisc = startTower[0];
          const topEndDisc = endTower[0];
          return topStartDisc < topEndDisc;
        }
    }

    print() {
        console.log(JSON.stringify(this.towers));
    }

    isWon() {
        return this.towers[2].length === 3;
    }

    move(startTowerIdx, endTowerIdx) {
        if (this.isValidMove(startTowerIdx, endTowerIdx)) {
          this.towers[endTowerIdx].unshift(this.towers[startTowerIdx].shift());
          return true;
        } else {
          return false;
        }
    }

    run(reader, completionCallback) {
        this.promptMove(reader, (startTowerIdx, endTowerIdx) => {
            if (!this.move(startTowerIdx, endTowerIdx)) {
                console.log('Invalid Move!');
            }

            if (!this.isWon()) {
                // Continue to play!
                this.run(reader, completionCallback);
              } else {
                this.print();
                console.log("You win!");
                completionCallback();
            }
        });
    };
}

module.exports = Game;

// let game = new Game;
// game.promptMove();
// console.log(game.isWon());
// game.move(0,1);
// game.print();


