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



## Making your own sketch
Lets try and set up an empty sketch using the template below:

	OPC opc;

	void setup() {
		size(500, 500, P3D);

  		opc = new OPC(this, "127.0.0.1", 7890);
  		opc.ledGrid8x8(0, width/2, height/2, height / 16.0, 0, false);
	}

	void draw() {
	  background(0);
	}

Here the important part is the ledGrid8x8 line. First we have a 0, this indicated that we have connected the led matrix to connector 0 on the fadecandy. Next we need to define the center of the matrix. This is done using `width/2` and `height/2`. We also need to define the spacing between each LED. The spacing is approximately one LED in size, so we can use `height/16`. The next 0 is the rotation. Since we just use the default rotation we dont need to change this. `false` means that all the LEDs point in the same direction.

If we run this nothing will really happen except we get a black screen with 8x8 dots on.

We can change the individual colors using `setPixel(index, color)` in the draw function.


	opc.setPixel(0, color(255,0,0));

The above code changes the color of the first pixel to red.

	opc.setPixel(10, color(0,255,0));

The above code changes the 11th pixel to green.

This should make sense and be easy to work with.

Unfortunately each pixel does have a bit of color bleeding to nearby pixels, this can be prevented using a printed separator or another time of plate in front.

## Webserver

It is easy to test and identify different fadecandy's using the port the fadecandy is set up to. Just go to `localhost:port` and play around

	http://localhost:7890
	
Here is you you can identify the Fadecandy if multiple ones are connected or test all the LEDs. There is also an option to configure the server using JSON, but that’s not something I want to get into now. 

![](http://drudoo.com/Stuff/online.png)

## LED Strip

It is also possible to connect LED stips of various length to the fadecandy. It is basically the same as using a matrix but to initialize the stip we are using:

	opc.ledStrip(0, 64, width/2, height/2, width / 70.0, 0, false);
	
First we have the index, since this is the first row of pixels we just use 0 as index. Here we just say the length is 64 pixels, with a midpoint the same as the grid. The spacing is a bit different, but with 64 pixels `width/70` should work. `0` is again the rotation and false specify to direction. 

It's straightforward to change individual pixels and in order to use images as source for the pattern, the fadecandy examples are a good source of information. 