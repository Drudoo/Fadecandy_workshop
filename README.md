# Fadecandy Workshop

This is going to be a small guide for using the [NeoPixels](https://www.adafruit.com/category/168) together with the [Fadecandy](https://github.com/scanlime/fadecandy) controller. We are going to use a single 8x8 NeoPixel board and a single Fadecandy controller.

## Components

We are going to use very few components:

- 1x Adafruit NeoPixel 8x8
- 1x Fadecandy
- 4x Jumper cables (male to male)
- Header pins
- Breadboard
- Mini USB cable
- Power Supply



## Soldering

This is a one time thing and I just did it to make the NeoPixels easier to use later on.

Take the header pins and put them so you have two sets of 3 pins and two sets of 2 pins.

![](http://www.drudoo.com/wp-content/uploads/2016/03/Photo-Feb-15-6-46-24-PM-e1456938625359.jpg)

First take the two sets of 3 pins and solder them on the back of the NeoPixel matrix so we can plug the matrix into the breadboard.

![](http://www.drudoo.com/wp-content/uploads/2016/03/Photo-Feb-15-6-46-17-PM-e1456938734420.jpg)

Next solder the two sets of 2 pins on the GPIO pin 0 and 7 on the Fadecandy. We are actually just going to use one of the ports (GPIO pin 0) but if we have header pins on both 0 and 7, it will be better fastened to the breadboard.

![](http://www.drudoo.com/wp-content/uploads/2016/03/Photo-Feb-15-7-24-42-PM-e1456938752211.jpg)


## Wiring

The wiring is very simple. We have 4 jumper cables:

- 2 groung
- 1 power
- 1 input



![](https://camo.githubusercontent.com/4b9058c8cadc29ab7c19e6786a91c31d47281212/68747470733a2f2f7261772e6769746875622e636f6d2f7363616e6c696d652f6661646563616e64792f6d61737465722f646f632f696d616765732f73797374656d2d6469616772616d2d312e706e67)

(source: https://github.com/scanlime/fadecandy)



We connect the top port (blue) on the GPIO port 0 to the DIN (input) pin on the NeoPixel matrix. The bottom port (black) to the ground pin on the NeoPixel and that's all for connecting the NeoPixels to the Fadecandy.


We are now going to need some power. There are two options, if we are just running a single board we can use USB power. So for this we need a USB cable with header pins in one end (as seen on the picture below).

![](http://www.drudoo.com/wp-content/uploads/2016/03/Photo-Feb-15-7-38-03-PM-e1456939049523.jpg)

Attach the cable to the board and attach a black jumper cable from ground on the USB cable to ground on the NeoPixels, and a red jumper cable from the power on the USB cable to the 5v input on the NeoPixels.

![](http://www.drudoo.com/wp-content/uploads/2016/03/Photo-Feb-15-7-43-19-PM-e1456939033409.jpg)

## Code

Download the Fadecandy software from their GitHub site [link](https://github.com/scanlime/fadecandy) and extract it somewhere on your computer.

Open the terminal (OS X/Linux) or command line (Windows) and go to your downloaded folder.



	cd ~/Downloads/fadecandy-master



Inside that folder we need to go to the bin folder.

	cd bin

Now we can run the fadecandy server depending on our platform. I'm using OS X.

	open fcserver-osx

Connect the fadecandy to the computer using the mini USB cable and it should now be registered.

Open up the folder called `examples/processing/grid8x8\_dot` and open the processing sketch `grid8x8\_dot.pde` with Processing. Run it and the fadecandy should have a green light on and Processing should look like this

![](http://www.drudoo.com/wp-content/uploads/2016/03/Screen-Shot-2016-02-15-at-7.55.46-PM.png)

Connect the USB power to your computer and you should now be able to move your mouse around in the Processing sketch and change the light on the NeoPixel matrix.

If you don't have a USB cable with header pins on you can use a regular 5V ~2A power supply. Connect the ground and 5V pin from the NeoPixel matrix to the power supply and run the Processing sketch for the same result.

![](http://www.drudoo.com/wp-content/uploads/2016/03/Photo-Feb-15-7-10-31-PM-e1456939241663.jpg)
