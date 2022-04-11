class Clock {
    constructor() {
      // 1. Create a Date object.
      const date = new Date();

      // 2. Store the hours, minutes, and seconds.
      this.hours = date.getHours();
      this.minutes = date.getMinutes();
      this.seconds = date.getSeconds();

      // 3. Call printTime.
      this.printTime();
      // 4. Schedule the tick at 1 second intervals.
    }
  
    printTime() {
      // Format the time in HH:MM:SS
      const currentTime = `${this.hours}:${this.minutes}:${this.seconds}`;

      // Use console.log to print it.
      console.log(currentTime);
    }
  
    _tick() {
      // 1. Increment the time by one second.
        if (this.seconds === 59) {
            if (this.minutes === 59) {
                this.hours++;
                this.minutes = 0;
            } else {
                this.minutes++;
                this.seconds = 0;
            }
        } else {
            this.seconds++;
        }

      // 2. Call printTime.
      this.printTime();
    }
  }
  
const clock = new Clock();

clock.printTime;
